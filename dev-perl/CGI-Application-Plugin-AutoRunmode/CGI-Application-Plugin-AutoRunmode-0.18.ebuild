# Copyright 2012 Defiance Engineering
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=THILO
MODULE_VERSION=0.18
inherit perl-module

DESCRIPTION="Plugin to automatically register runmodes"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/CGI-Application"
RDEPEND="${DEPEND}"

