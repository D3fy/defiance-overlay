# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/${PN}/${PN}"

inherit golang-vcs-snapshot user

DESCRIPTION="RESTful based volume management framework for GlusterFS"
HOMEPAGE="https://github.com/heketi/heketi"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"

LICENSE="LGPL-3 GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-go/glide"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}
}

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH=${S} APP_SUFFIX="${PV}-gentoo" emake
}

src_install() {
	local x

	dobin  "${S}/src/${EGO_PN}/client/cli/go/${PN}-cli"
	dosbin "${S}/src/${EGO_PN}/${PN}"

	dodir   /etc/${PN}
	insinto /etc/${PN}
	doins   "${S}/src/${EGO_PN}/etc/${PN}.json"

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"

	for x in /var/{lib,log}/${PN}; do
		keepdir "${x}"
		fowners ${PN}:${PN} "${x}"
	done

	doman  "${S}/src/${EGO_PN}/doc/man/*"
	dodoc  "${S}/src/${EGO_PN}/README.md"
}
