# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Multi-Buffer Crypto for IPsec Library"
HOMEPAGE="https://github.com/intel/intel-ipsec-mb"
SRC_URI="https://github.com/intel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="dev-lang/nasm"

src_compile() {
	emake
	use static-libs && emake SHARED=n
}

src_install() {
	dodir /usr/include
	emake \
		DESTDIR="${D}" PREFIX="${D}${EPREFIX}usr" \
		LIB_INSTALL_DIR="${D}${EPREFIX}usr/$(get_libdir)" \
		MAN_DIR="${D}${EPREFIX}usr/share/man" \
		NOLDCONFIG=y install
	use static-libs && \
		emake DESTDIR="${D}" PREFIX="${D}${EPREFIX}usr" \
		LIB_INSTALL_DIR="${D}${EPREFIX}usr/$(get_libdir)" \
		MAN_DIR="${D}${EPREFIX}usr/share/man" \
		NOLDCONFIG=y SHARED=n install
	dodoc    {LICENSE,README}
}
