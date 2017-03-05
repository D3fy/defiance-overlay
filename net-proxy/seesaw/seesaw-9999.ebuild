# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user linux-info golang-build

EGO_SRC=github.com/google/seesaw
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="68c687dc49948540b356a6b47931c9be4fcd0245"
	SRC_URI="https://${EGO_SRC}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

DESCRIPTION="Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform"
HOMEPAGE="https://github.com/google/seesaw"
# EGIT_REPO_URI="${HOMEPAGE}"

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

src_compile() {
	# pushd src/${EGO_PN%/*} || die
	# GOPATH="${WORKDIR}/${P}:/usr/portage/distfiles/go-src" make -j1
	# popd || die
	golang-build_src_compile
}

src_install() {
	golang-build_src_install
	dobin bin/*
}
