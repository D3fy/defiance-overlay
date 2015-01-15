# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="RJBS"

inherit perl-module

DESCRIPTION="test routines for testing numbers against tolerances"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	>=dev-perl/Sub-Exporter-0.987.0
	test? ( dev-perl/Test-Tester )
"
