# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=GWYN
MODULE_VERSION=0.05
inherit perl-module

DESCRIPTION="Install readonly files from a distro"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

perl_meta_configure() {
	# ExtUtils::MakeMaker
	echo virtual/perl-ExtUtils-MakeMaker
	# File::Spec
	echo virtual/perl-File-Spec
}

RDEPEND="
	$(perl_meta_configure)
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
