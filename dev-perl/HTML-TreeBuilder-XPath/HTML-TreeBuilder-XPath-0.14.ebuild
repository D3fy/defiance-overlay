# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MIROD
MODULE_VERSION=0.14
inherit perl-module

DESCRIPTION="HTML::TreeBuilder::XPath - add XPath support to HTML::TreeBuilder"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/HTML-Tree
	dev-perl/XML-XPathEngine"
RDEPEND="${DEPEND}"

