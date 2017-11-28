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
IUSE="shared ssl"

DEPEND="
	dev-lang/nasm
	sys-process/numactl
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

function ctarget() {
	CTARGET="${ARCH}"
	use amd64 && CTARGET='x86_64'
	echo $CTARGET
}

pkg_setup() {
	linux-mod_pkg_setup
}

src_configure() {
	ARCH=$(ctarget) emake config \
		T=$(ctarget)-native-linuxapp-$(tc-get-compiler-type)
}

src_compile() {
	cd ${S}/build || die
	ARCH=$(ctarget) emake \
		RTE_DEVEL_BUILD=n \
		CONFIG_RTE_BUILD_SHARED_LIB=$(use shared && echo 'y' || echo 'n') \
		CONFIG_RTE_LIBRTE_PMD_OPENSSL=$(use ssl && echo 'y' || echo 'n') \
		EXTRA_CFLAGS="${CFLAGS}"
}

src_install() {
	pushd ${S}/build > /dev/null || die
	sed -i -e 's/^ifdef\ T/ifdef\ TMPL/' ../mk/rte.sdkinstall.mk
	ARCH=$(ctarget) emake install \
			DESTDIR=${D} \
			libdir="${EPREFIX}/usr/$(get_libdir)"
			prefix="${EPREFIX}/usr"
	popd > /dev/null
	use shared && use amd64 && mv ${D}/usr/lib ${D}/usr/lib64
}
