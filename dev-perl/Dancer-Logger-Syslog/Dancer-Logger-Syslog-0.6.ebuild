# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="YANICK"
inherit perl-module

DESCRIPTION="Dancer logger engine for Sys::Syslog"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	dev-perl/Dancer
	virtual/perl-Sys-Syslog
	virtual/perl-File-Spec
	virtual/perl-Module-Build
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
