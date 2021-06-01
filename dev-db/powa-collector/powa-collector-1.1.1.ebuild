# Copyright 2021 Dan Molik
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8,9} )

inherit python-single-r1

DESCRIPTION="A multi-threaded program that performs the snapshots for the remote servers configured in a powa repository."
HOMEPAGE="https://powa.readthedocs.io/"
SRC_URI="https://github.com/powa-team/powa-collector/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/psycopg[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="${RDEPEND}"
