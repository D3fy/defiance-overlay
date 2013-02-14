# Distributed under the terms of the GNU General Public License v2

EAPI=4

MODULE_AUTHOR=BLOM
MODULE_VERSION=0.02
inherit perl-module

DESCRIPTION="WWW::Mechanize::Plugin::Web::Scraper - Scrape the planet!"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/WWW-Mechanize-Pluggable
	dev-perl/Web-Scraper
	dev-perl/HTML-TreeBuilder-XPath
	dev-perl/HTML-Selector-XPath"
RDEPEND="${DEPEND}"

