# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=LEONT
MODULE_VERSION=0.030
inherit perl-mb-tiny

DESCRIPTION="A tiny replacement for Module::Build"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/perl-Module-Build
	virtual/perl-XSLoader
	virtual/perl-File-Spec
	virtual/perl-Test-Harness
	dev-perl/ExtUtils-Helpers
	virtual/perl-ExtUtils-CBuilder
	virtual/perl-CPAN-Meta
	virtual/perl-File-Path
	virtual/perl-IPC-Cmd
	virtual/perl-Getopt-Long
	virtual/perl-Data-Dumper
	virtual/perl-ExtUtils-ParseXS
	virtual/perl-JSON-PP
	dev-perl/ExtUtils-InstallPaths
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
