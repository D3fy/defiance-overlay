# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR="MLEHMANN"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/Types-Serialiser
	test? (  dev-perl/Canary-Stability )
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
