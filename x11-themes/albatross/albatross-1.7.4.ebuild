# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN=${PN/a/A}

DESCRIPTION="Desktop Suite for Xfce"
HOMEPAGE="http://shimmerproject.org/projects/albatross/"
SRC_URI="https://github.com/shimmerproject/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ayatana gnome"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

src_unpack() {
	unpack ${A}
	mv ${MY_PN}-* "${S}" || die
}

src_install() {
	dodoc README
	rm -f README LICENSE*

	insinto /usr/share/themes/${MY_PN}/xfwm4
	doins xfwm4/*
	rm -rf xfwm4

	use ayatana || rm -rf unity
	use gnome || rm -rf metacity-1

	insinto /usr/share/themes/${MY_PN}
	doins -r *
}
