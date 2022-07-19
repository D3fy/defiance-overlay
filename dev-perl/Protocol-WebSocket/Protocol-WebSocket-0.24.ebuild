# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="VTI"
MODULE_VERSION=${PV}
inherit perl-module

DESCRIPTION="WebSocket protocol"

LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/Module-Build-Tiny
	virtual/perl-Digest-MD5
	virtual/perl-Digest-SHA
"
DEPEND="${RDEPEND}"
