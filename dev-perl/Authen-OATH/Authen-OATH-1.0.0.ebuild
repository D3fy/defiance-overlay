# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="SIFUKURT"
inherit perl-module

DESCRIPTION="OATH One Time Passwords"
SRC_URI="mirror://cpan/authors/id/S/SI/SIFUKURT/${PN}-v${PV}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"

SLOT="0"

KEYWORDS="~arm amd64 amd64-linux x86 x86-linux"
IUSE=""

RDEPEND="
	dev-perl/Digest-HMAC
	dev-perl/Digest-SHA1
	virtual/perl-Math-BigInt
	dev-perl/Moose
"
DEPEND="
	dev-perl/Module-Build
	${RDEPEND}
"
