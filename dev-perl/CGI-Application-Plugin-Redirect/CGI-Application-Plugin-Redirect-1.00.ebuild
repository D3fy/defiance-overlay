# Copyright 2012 Defiance Engineering
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=CEESHEK
MODULE_VERSION=1.00
inherit perl-module

DESCRIPTION="Easy external redirects in CGI::Application"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/CGI-Application"
RDEPEND="${DEPEND}"

