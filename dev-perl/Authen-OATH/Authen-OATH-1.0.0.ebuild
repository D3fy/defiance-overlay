# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MODULE_AUTHOR="SIFUKURT"
inherit perl-module

DESCRIPTION="OATH One Time Passwords"
SRC_URI="http://search.cpan.org/CPAN/authors/id/S/SI/SIFUKURT/${PN}-v${PV}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"
#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="
	dev-perl/Digest-HMAC
	dev-perl/Digest-SHA1
	virtual/perl-Math-BigInt
	dev-perl/Moose
"
DEPEND="${RDEPEND}"
