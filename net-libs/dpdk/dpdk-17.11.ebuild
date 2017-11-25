# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs flag-o-matic linux-info linux-mod

DESCRIPTION="A set of libraries and drivers for fast packet processing"
HOMEPAGE="http://dpdk.org/"
SRC_URI="http://fast.${PN}.org/rel/${P}.tar.xz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	linux-mod_pkg_setup
}

src_install() {
	CTARGET="${ARCH}"
	use amd64 && CTARGET='x86_64'
	ARCH=${CTARGET} emake install \
		T=${CTARGET}-native-linuxapp-$(tc-get-compiler-type) \
		RTE_DEVEL_BUILD=n \
		prefix="${EPREFIX}/usr" \
		DESTDIR=${D} \
		EXTRA_CFLAGS="${CFLAGS}"
}
