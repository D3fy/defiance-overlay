# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils pax-utils qt4-r2

DESCRIPTION="Headless WebKit with JavaScript API"
HOMEPAGE="http://www.phantomjs.org/"
SRC_URI="http://phantomjs.googlecode.com/files/${P}-source.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples doc -pack +text-rendering"

DEPEND="
	app-arch/unzip
	pack? ( || ( app-arch/upx-bin app-arch/upx-ucl ) )
	text-rendering? ( media-libs/freetype media-libs/fontconfig )
"
RDEPEND="
	!www-client/phantomjs-bin
	text-rendering? ( media-libs/freetype media-libs/fontconfig )
"
if use pack; then
	RESTRICT="${RESTRICT} strip"
fi

src_prepare() {
	epatch "${FILESDIR}"/unicode-signed.patch
}

src_configure() {
	eqmake4
}

src_compile() {
	emake

	if use pack; then
		if has nostrip ${FEATURES}; then
			ewarn "Packing and not stripping is suboptimal."
		else
			# Strip before packing:
			strip -s bin/phantomjs || die
		fi

		upx -qqq --best bin/phantomjs || die
	fi
}

src_install() {
	pax-mark m bin/phantomjs || die
	dobin bin/phantomjs || die

	if use doc; then
		dodoc ChangeLog LICENSE.BSD README.md third-party.txt || die
	fi

	if use examples; then
		docinto examples
		dodoc examples/* || die
	fi
}

src_test() {
	./bin/phantomjs test/run-tests.js || die
}
