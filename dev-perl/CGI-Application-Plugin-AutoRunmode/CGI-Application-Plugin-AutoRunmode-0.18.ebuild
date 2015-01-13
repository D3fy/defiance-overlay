# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=THILO
MODULE_VERSION=0.18
inherit perl-module

DESCRIPTION="Plugin to automatically register runmodes"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-perl/CGI-Application
"
RDEPEND="${DEPEND}"
