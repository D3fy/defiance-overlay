# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ALEXBIO"
inherit perl-module

DESCRIPTION="Perl bindings to the portable FFI library (libffi)"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/libffi
	virtual/perl-XSLoader
	dev-perl/Devel-CheckLib
	perl-core/Math-BigInt
	virtual/perl-ExtUtils-CBuilder
	virtual/perl-Text-ParseWords
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
