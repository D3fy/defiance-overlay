# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR=KAZEBURO
MODULE_VERSION=${PV}
inherit perl-module

DESCRIPTION="a Preforked Plack Handler for performance freaks"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/Module-Build
	dev-perl/Guard
	dev-perl/Try-Tiny
	dev-perl/Plack
	dev-perl/Server-Starter
	dev-perl/Parallel-Prefork
	dev-perl/Devel-CheckCompiler
"
DEPEND="${RDEPEND}"
PATCHES=( "${FILESDIR}/build.patch" )
src_unpack() {
	perl-module_src_unpack
}
SRC_TEST="do"
