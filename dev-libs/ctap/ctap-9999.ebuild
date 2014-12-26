# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

EGIT_REPO_URI="https://github.com/graytshirt/ctap"

if [[ ${PV} != 9999 ]] ; then
	# Set the commit ID
	EGIT_COMMIT="b2917873875d0e751232f0c5aabf9a4925a6104b"
	KEYWORDS="amd64 x86 x86-linux"
fi

SLOT="0"

LICENSE="GPL3"
DESCRIPTION="Test Anything Protocol (tap) for C"
HOMEPAGE="https://github.com/filefrog/ctap/"

AUTOTOOLS_AUTORECONF=yes
IUSE="static-libs"

RDEPEND="${DEPEND}"
