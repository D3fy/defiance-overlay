# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MODULE_AUTHOR="DANKOGAI"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
"
DEPEND="${RDEPEND}"
