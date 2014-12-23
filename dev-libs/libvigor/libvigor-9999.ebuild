# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

AUTOTOOLS_AUTORECONF=yes

DESCRIPTION="The missing bits of C"
HOMEPAGE="https://github.com/filefrog/libvigor"
EGIT_REPO_URI="https://github.com/graytshirt/libvigor"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/ctap
	dev-libs/libsodium
	net-libs/zeromq
"
RDEPEND="${DEPEND}"
