# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR="NEOPHENIX"
inherit perl-module

DESCRIPTION="interact with Redis using the hiredis client"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/hiredis"
DEPEND="${RDEPEND}"

SRC_TEST="do"
