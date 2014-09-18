# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MCMAHON
MODULE_VERSION=1.12
inherit perl-module

DESCRIPTION="WWW Mechanize Pluggable A WWW Mechanize that is custmomizable via plugins"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/WWW-Mechanize
	dev-perl/Data-Dump-Streamer"
RDEPEND="${DEPEND}"

