# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Valkey client library in C"
HOMEPAGE="https://github.com/valkey-io/libvalkey"
SRC_URI="https://github.com/valkey-io/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/make"

src_compile() {
	emake USE_TLS=1 PREFIX=/usr LIBRARY_PATH=lib64 || die "emake failed"
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" LIBRARY_PATH=lib64 USE_TLS=1 install
	dodoc README.md docs/cluster.md docs/standalone.md
}
