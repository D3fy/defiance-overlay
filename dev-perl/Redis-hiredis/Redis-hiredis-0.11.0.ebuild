# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="NEOPHENIX"
inherit perl-module

DESCRIPTION="interact with Redis using the hiredis client"

SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/hiredis"
DEPEND="${RDEPEND}"

SRC_TEST="do"
