# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="KAZEBURO"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	virtual/perl-CPAN-Meta
	virtual/perl-Module-Build
	test? ( dev-perl/Test-TCP )
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
