# Copyright 2021 Dan Molik
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9,10} )

inherit distutils-r1

DESCRIPTION="A multi-threaded program that performs the snapshots for the remote servers configured in a powa repository."
HOMEPAGE="https://powa.readthedocs.io/"
SRC_URI="https://github.com/powa-team/powa-collector/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/psycopg[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

python_install_all() {
	USE_SETUPTOOLS=1 distutils-r1_python_install_all

	newinitd ${FILESDIR}/${PN}.initd ${PN}

	insinto /etc/
	doins ${FILESDIR}/${PN}.conf.example
}
