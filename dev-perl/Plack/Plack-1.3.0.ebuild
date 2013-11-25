# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MIYAGAWA
MODULE_VERSION=1.0030
inherit perl-module

DESCRIPTION="PSGI toolkit and servers"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-perl/libwww-perl-5.814.0
	>=dev-perl/URI-1.590.0
	virtual/perl-PodParser
	>=dev-perl/File-ShareDir-1.0.0
	dev-perl/Try-Tiny
	virtual/perl-parent
	>=dev-perl/Devel-StackTrace-1.230.0
	>=dev-perl/Devel-StackTrace-AsHTML-0.110.0
	dev-perl/Filesys-Notify-Simple
	>=dev-perl/Hash-MultiValue-0.50.0
	>=dev-perl/HTTP-Body-1.60.0
	>=dev-perl/Test-TCP-1.20.0
	>=dev-perl/Stream-Buffered-0.20.0
	dev-perl/File-ShareDir-Install
"
DEPEND="${RDEPEND}
	test? (
		>=virtual/perl-Test-Simple-0.88
		dev-perl/Test-Requires
	)"

SRC_TEST=do
