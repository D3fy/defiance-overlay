# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_AUTORECONF=yes

inherit base autotools-utils eutils git-2

DESCRIPTION="Test Anything Protocol (tap) for C"
HOMEPAGE="https://github.com/filefrog/ctap/"
EGIT_REPO_URI="https://github.com/filefrog/ctap"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

