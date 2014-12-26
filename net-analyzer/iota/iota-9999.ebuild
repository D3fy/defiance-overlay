# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

EGIT_REPO_URI="https://github.com/filefrog/iota"

if [[ ${PV} != 9999 ]] ; then
	# Set the commit ID
	EGIT_COMMIT="17410de9675dff2d0071d1617c5e33a29007fce1"
	KEYWORDS="~amd64 ~x86 ~x86-linux"
fi

AUTOTOOLS_AUTORECONF=yes

DESCRIPTION="A commodity metric broker"
HOMEPAGE="https://github.com/filefrog/iota"

LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/ctap-1.1.5
	>=dev-libs/libvigor-1.1.0
"
