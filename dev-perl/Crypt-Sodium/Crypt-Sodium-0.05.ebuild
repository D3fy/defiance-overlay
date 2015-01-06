# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MGREGORO"
inherit perl-module

DESCRIPTION="Crypt::Sodium - Perl bindings for libsodium (NaCL)"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/libsodium
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}"

SRC_TEST="do"