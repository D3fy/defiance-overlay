# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

DESCRIPTION="Concurrent Programming Library (Coroutine) for C"
HOMEPAGE="https://github.com/sharow/libconcurrent"
EGIT_REPO_URI="https://github.com/sharow/${PN}"

LICENSE="Copyright"
SLOT="0"
KEYWORDS="~*"
IUSE=""

DEPEND="
	dev-lang/nasm
"
RDEPEND="${DEPEND}"

src_configure() {
	einfo "${P} has no configuration step"
}

src_compile() {
	export ARCH=$(uname -m)
	emake -j1 all || die "failed to build $P"
}

src_install() {
	export ARCH=$(uname -m)
	emake DESTDIR="${D}" install
}
