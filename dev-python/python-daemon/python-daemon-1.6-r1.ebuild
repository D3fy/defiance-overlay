# Distributed under the terms of the GNU General Public License v2

EAPI="5-progress"
PYTHON_MULTIPLE_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"
# dev-python/lockfile requires >=2.6.
PYTHON_RESTRICTED_ABIS="2.4 2.5 2.5-jython 3.*"

inherit distutils

DESCRIPTION="Library to implement a well-behaved Unix daemon process."
HOMEPAGE="http://pypi.python.org/pypi/python-daemon"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="$(python_abi_depend dev-python/lockfile)"
DEPEND="${RDEPEND}
	$(python_abi_depend dev-python/setuptools)
	test? ( $(python_abi_depend dev-python/minimock) )"
PYTHON_MODNAME="daemon"
DOCS="ChangeLog"
