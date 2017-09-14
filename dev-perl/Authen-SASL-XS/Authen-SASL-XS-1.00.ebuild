# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR="GBARR"
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	dev-perl/Devel-CheckLib
	dev-perl/Authen-SASL
	${RDEPEND}"
