# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="DOMQ"

inherit perl-module

DESCRIPTION="The crypto parts of an X509v3 Certification Authority"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	>=dev-perl/Net-SSLeay-1.550
	dev-perl/IPC-Run
	dev-perl/Inline
	dev-perl/Devel-Mallinfo
	>=dev-perl/Convert-ASN1-0.260.0
	dev-perl/File-Slurp
	dev-perl/Devel-Leak
	test? ( dev-perl/Test-Group )
"
