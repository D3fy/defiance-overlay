# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_AUTORECONF=yes

inherit base autotools-utils eutils git-2

DESCRIPTION="The nifty configuration managment system"
HOMEPAGE="http://clockwork.niftylogic.com/"
EGIT_REPO_URI="https://github.com/filefrog/clockwork"

LICENSE="CCLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libxml2
	app-admin/augeas
	dev-libs/ctap
"
RDEPEND="${DEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD=1
