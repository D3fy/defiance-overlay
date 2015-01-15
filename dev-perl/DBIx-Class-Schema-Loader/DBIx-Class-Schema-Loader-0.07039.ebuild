# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ILMARI"

inherit perl-module

DESCRIPTION="Create a DBIx::Class::Schema based on a database"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	>=dev-perl/String-CamelCase-0.02
	>=dev-perl/Scope-Guard-0.200.0
	>=dev-perl/Class-Unload-0.70.0
	>=dev-perl/DBD-SQLite-1.400.0
	>=dev-perl/List-MoreUtils-0.330.0
	>=dev-perl/MRO-Compat-0.120.0
	dev-perl/DBIx-Class
	dev-perl/Try-Tiny
	>=dev-perl/Class-Accessor-Grouped-0.100.90
	>=dev-perl/String-ToIdentifier-EN-0.11
	>=dev-perl/Hash-Merge-0.120.0
	>=dev-perl/Lingua-EN-Inflect-Number-1.1
	>=dev-perl/Lingua-EN-Inflect-Phrase-0.18
	>=dev-perl/Lingua-EN-Tagger-0.24
	dev-perl/Sub-Name
	>=dev-perl/namespace-clean-0.240.0
	dev-perl/Class-C3-Componentised
	dev-perl/DBIx-Class-IntrospectableM2M
	dev-perl/Carp-Clan
	>=dev-perl/Class-Inspector-1.280.0
	test? (
		>=dev-perl/Test-Warn-0.240.0
		>=dev-perl/Test-Exception-0.320.0
	)
"
