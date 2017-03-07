# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user linux-info golang-build golang-vcs-defiance

EGO_SRC=github.com/google/seesaw
EGO_PN=${EGO_SRC}/...

DESCRIPTION="Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform"
HOMEPAGE="https://github.com/google/seesaw"
KEYWORDS="~amd64 ~x86"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="anycast"

DEPEND="
	dev-libs/libnl
	dev-go/go-protobuf
	anycast? ( net-misc/quagga[protobuf] )
"
RDEPEND="
	anycast? ( net-misc/quagga[protobuf] )
"

RESTRICT="test"

CHECK_CHECK="~IP_VS"
WARNING_IP_VS="CONFIG_IP_VS isn't set. Seesaw will be unable to loadbalance traffic!"

src_unpack() {
	golang-vcs-defiance_src_unpack
}

src_compile() {
	golang-build_src_compile
}

src_install() {
	env GOPATH="${WORKDIR}/${P}" \
		go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"
	newinitd "${FILESDIR}"/${PN}-watchdog.initd ${PN}-watchdog
	dobin     bin/*
	pushd     src/"${EGO_PN%/*}" || die
	dodoc     README.md
	sed -i -e 's/\/usr\/local\/seesaw/\/usr\/bin/' etc/${PN}/*
	insinto  /etc/${PN}
	doins     etc/${PN}/*
	popd      || die
	setcap cap_net_raw+ep "${ED}"/usr/bin/seesaw_ha
	setcap cap_net_raw+ep "${ED}"/usr/bin/seesaw_healthcheck
}
