# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

EGIT_REPO_URI="https://github.com/filefrog/bolo"

if [[ ${PV} != 9999 ]] ; then
	# Set the commit ID
	EGIT_COMMIT="8a5e110f99450ba1914f0d1a9c536a588a5589b5"
	KEYWORDS="~amd64 ~x86 ~x86-linux"
fi

AUTOTOOLS_AUTORECONF=yes

DESCRIPTION="The Bolo Monitoring System"
HOMEPAGE="https://github.com/filefrog/bolo"

LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/ctap-1.1.5
	>=dev-libs/libvigor-1.1.0
"
RDEPEND="${DEPEND}"
