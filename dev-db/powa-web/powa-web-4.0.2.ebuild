# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1 eutils versionator flag-o-matic

DESCRIPTION="The PostgreSQL Workload Analyzer web frontend"
HOMEPAGE="http://powa.readthedocs.io/en/latest/powa-web/index.html"
SRC_URI="https://pypi.io/packages/source/p/${PN}/${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/psycopg[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
${DEPEND}"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
	local CFLAGS=${CFLAGS} CXXFLAGS=${CXXFLAGS}

	! python_is_python3 && append-flags -fno-strict-aliasing

	distutils-r1_python_compile
}

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all
}
