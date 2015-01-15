# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="RKRIMEN"

inherit perl-module

DESCRIPTION="Share your Carp::Clan settings with your whole Clan"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE=""

DEPEND="
	dev-perl/Carp-Clan
"
