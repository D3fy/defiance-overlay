# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MARKOV"
inherit perl-module

DESCRIPTION="Perl OAuth 2.0 implementation"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-perl/URI
	dev-perl/yaml
	dev-perl/HTTP-Message
	dev-perl/libwww-perl
	dev-perl/JSON
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
