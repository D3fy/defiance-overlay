# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR=BOOK
MODULE_VERSION=1.301
inherit perl-module

DESCRIPTION="Perl interface to Git repositories"

SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/System-Command"
RDEPEND="${DEPEND}"
