EAPI=5

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils vcs-snapshot

DESCRIPTION="A file watching service."
HOMEPAGE="https://github.com/facebook/watchman"

SRC_URI="https://github.com/facebook/watchman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libpcre"
DEPEND="${RDEPEND}"
