# Copyright 2012 Defiance Engineering
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=CEESHEK
MODULE_VERSION=1.05
inherit perl-module

DESCRIPTION="Add Template Toolkit support to CGI::Application"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/CGI-Application"
RDEPEND="${DEPEND}"

