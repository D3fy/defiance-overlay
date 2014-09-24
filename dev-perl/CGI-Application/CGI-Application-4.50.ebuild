# Copyright 2012 Defiance Engineering
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MARKSTOS
MODULE_VERSION=4.50
inherit perl-module

DESCRIPTION="Framework for building reusable web-application"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/HTML-Template
	virtual/perl-CGI
	virtual/perl-Module-Build
RDEPEND="${DEPEND}"

