# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/kardianos/govendor"
inherit golang-build golang-vcs-snapshot

ARCHIVE_URI="https://github.com/kardianos/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Go vendor tool that works with the standard vendor file"
HOMEPAGE="https://github.com/kardianos/govendor"
SRC_URI="${ARCHIVE_URI}"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
}
