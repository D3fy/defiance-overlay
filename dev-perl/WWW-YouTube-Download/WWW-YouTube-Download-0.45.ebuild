# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=XAICRON
MODULE_VERSION=0.45
inherit perl-module

DESCRIPTION="Framework for building reusable web-application"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/WWW-Mechanize"
RDEPEND="${DEPEND}"

