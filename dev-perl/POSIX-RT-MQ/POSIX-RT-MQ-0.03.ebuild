# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR="ILJATABAC"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="virtual/perl-Carp"
DEPEND="${RDEPEND}"

SRC_TEST="do"
