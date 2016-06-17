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
	dev-perl/Module-Build
	dev-perl/Dancer
	virtual/perl-Sys-Syslog
	virtual/perl-File-Spec
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
