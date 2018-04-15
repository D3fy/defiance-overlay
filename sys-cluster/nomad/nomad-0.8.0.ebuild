# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot user

KEYWORDS="~amd64"
EGO_PN="github.com/hashicorp/${PN}"
DESCRIPTION="The cluster manager from Hashicorp"
HOMEPAGE="http://www.nomadproject.io"
SRC_URI="https://github.com/hashicorp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MPL-2.0"
IUSE="lxc"

RESTRICT="strip test"

DEPEND="
	lxc? ( app-emulation/lxc )
	dev-go/gox
	>=dev-lang/go-1.7.5:=
	>=dev-go/go-tools-0_pre20160121"
RDEPEND=""

pkg_setup() {
	enewgroup ${PN}
	enewuser  ${PN} -1 -1 /var/lib/${PN} ${PN}
}

src_prepare() {
	eapply_user

	sed -e 's@^\(GIT_DESCRIBE :=\).*@\1'${PV}'@' \
		-e 's@^\(GIT_COMMIT :=\).*@\1@' \
		-e 's@^\(GIT_DIRTY :=\).*@\1@' \
		-e 's@go get -u -v $(GOTOOLS)@@' \
		-e 's@ vendorfmt @@' \
		-i "${S}/src/${EGO_PN}/GNUmakefile" || die
}

src_compile() {
	# The dev target sets causes build.sh to set appropriate XC_OS
	# and XC_ARCH, and skips generation of an unused zip file,
	# avoiding a dependency on app-arch/zip.
	GOPATH="${S}" \
		emake -C "${S}/src/${EGO_PN}" pkg/linux_amd64$(use lxc && echo '-lxc')/${PN}
}

src_install() {
	local x

	dobin "${S}/src/${EGO_PN}/pkg/linux_amd64$(use lxc && echo '-lxc')/${PN}"

	for x in /var/{lib,log}/${PN}; do
		keepdir "${x}"
		fowners ${PN}:${PN} "${x}"
	done

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
}
