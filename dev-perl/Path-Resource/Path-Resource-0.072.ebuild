# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="RKRIMEN"

inherit perl-module

DESCRIPTION="URI/Path::Class combination"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	dev-perl/Path-Class
	dev-perl/Path-Abstract
	dev-perl/Class-Accessor
	test? (
		>=dev-perl/Test-Lazy-0.061
		dev-perl/Test-Most
	)
"
