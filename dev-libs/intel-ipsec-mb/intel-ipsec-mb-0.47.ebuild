# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Multi-Buffer Crypto for IPsec Library"
HOMEPAGE="https://github.com/intel/intel-ipsec-mb"
SRC_URI="https://github.com/intel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="shared"

DEPEND="
	dev-lang/nasm
"
RDEPEND="${DEPEND}"

src_compile() {
	emake
	use shared && emake SHARED=y
}

src_install() {
	dolib    "${S}/libIPSec_MB.a"
	pushd    ${S} > /dev/null || die
	insinto  "/usr/include/${PN}"
	doins    *.h
	doins    include/types.h
	popd > /dev/null || die
}
