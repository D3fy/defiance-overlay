# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils pax-utils

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
	QT_CFG='-opensource -confirm-license -v -static
	-system-freetype -fontconfig -qpa -release
	-fast -nomake demos -nomake docs -nomake examples
	-nomake translations -nomake tools -no-exceptions
	-no-stl -no-libmng -no-libtiff -icu -no-declarative
	-no-multimedia -no-opengl -no-openvg -no-phonon
	-no-qt3support -no-script -no-scripttools -no-svg
	-no-xmlpatterns -D QT_NO_GRAPHICSVIEW -D QT_NO_GRAPHICSEFFECT
	-graphicssystem raster -no-dbus -no-glib -no-gstreamer
	-no-gtkstyle -no-cups -no-sm -no-xinerama -no-xkb
	-qt-libjpeg -qt-libpng -qt-zlib -openssl -D QT_NO_STYLESHEET
	-D QT_NO_STYLE_CDE -D QT_NO_STYLE_CLEANLOOKS -D QT_NO_STYLE_MOTIF
	-D QT_NO_STYLE_PLASTIQUE'
	./src/qt/configure --prefix ${S}/src/qt $QT_CFG
	cd src/qt && make ${MAKEOPTS}
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
