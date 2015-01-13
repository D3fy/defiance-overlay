# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=CEESHEK
MODULE_VERSION=1.00
inherit perl-module

DESCRIPTION="Easy external redirects in CGI::Application"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-perl/CGI-Application
"
RDEPEND="${DEPEND}"
