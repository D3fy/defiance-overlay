# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="BORISZ"
inherit perl-module

DESCRIPTION="Low-level interface to the nanomsg scalability protocols library"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	virtual/perl-XSLoader
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-Time-HiRes
	dev-perl/Devel-CheckLib
	test? (
		dev-perl/Test-Fatal
		dev-perl/Test-TCP
	)
	>=dev-libs/nanomsg-0.2"
DEPEND="${RDEPEND}"

SRC_TEST="do"
