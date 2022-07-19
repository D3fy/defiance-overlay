# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="JHORWITZ"
inherit perl-module

DESCRIPTION="Perl extension for Kerberos 5"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/perl-Carp"
DEPEND="${RDEPEND}"
