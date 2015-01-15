# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROKR"

inherit perl-module

DESCRIPTION="Fast and featureful UNIX-style path parsing and manipulation"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	dev-perl/Sub-Exporter
	test? (
		dev-perl/Test-Lazy
		dev-perl/Test-Most
	)
"
