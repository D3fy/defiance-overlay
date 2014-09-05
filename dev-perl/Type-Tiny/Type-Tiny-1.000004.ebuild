# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="TOBYINK"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/perl-CPAN-Meta-Requirements
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/Exporter-Tiny
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
