# Distributed under the terms of the GNU General Public License v2

EAPI=4-python

PYTHON_DEPEND="<<2>>"

inherit python eutils pax-utils

RESTRICT="test"

DESCRIPTION="Evented IO for V8 Javascript"
HOMEPAGE="http://nodejs.org/"
SRC_URI="http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE="v8"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}
		v8? ( <=dev-lang/v8-3.17.16.2 )"

S=${WORKDIR}/node-v${PV}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	# fix compilation on Darwin
	# http://code.google.com/p/gyp/issues/detail?id=260
	sed -i -e "/append('-arch/d" tools/gyp/pylib/gyp/xcode_emulation.py || die
	# Hardcoded braindamage extraction helper
	# sed -i -e 's:wafdir = join(prefix, "lib", "node"):wafdir = "/lib/node/":' tools/node-waf || die

	cd ${S}
	for x in $(grep -r "/usr/bin/env python" * | cut -f1 -d":" ); do
		einfo "Tweaking $x for python2..."
		sed -e "s:/usr/bin/env python:/usr/bin/env python2:g" -i $x || die
	done
	sed -e "s/python/python2/g" -i Makefile || die
}

src_configure() {
	# this is an autotools lookalike confuserator
	# ./configure --shared-v8 --prefix="${EPREFIX}"/usr --shared-v8-includes="${EPREFIX}"/usr/include --openssl-use-sys --shared-zlib || die
	if use system-v8 ; then
		./configure --shared-v8 --shared-v8-libpath="${EPREFIX}"/usr/lib --shared-v8-includes="${EPREFIX}"/usr/include \
		--prefix="${EPREFIX}"/usr --openssl-use-sys --shared-zlib || die
	else
		./configure --prefix="${EPREFIX}"/usr --openssl-use-sys --shared-zlib || die
	fi
}

src_compile() {
	emake || die
}

src_install() {
	# Doesn't use make.
	mkdir -p "${ED}"/usr/include/node
	mkdir -p "${ED}"/usr/bin
	mkdir -p "${ED}"/lib/node_modules/npm
	mkdir -p "${ED}"/lib/node
	cp 'src/node.h' 'src/node_buffer.h' 'src/node_object_wrap.h' 'src/node_version.h' "${ED}"/usr/include/node || die "Failed to copy stuff"
	cp 'deps/cares/include/ares.h' 'deps/cares/include/ares_version.h' "${ED}"/usr/include/node || die "Failed to copy stuff"
	cp 'out/Release/node' "${ED}"/usr/bin/node || die "Failed to copy stuff"
	cp -R deps/npm/* "${ED}"/lib/node_modules/npm || die "Failed to copy stuff"
	cp -R tools/gyp "${ED}"/lib/node/ || die "Failed to copy stuff"
	cp 'tools/gyp_node' "${ED}"/usr/bin/ || die "Failed to copy stuff"

	# Has to be symlink
	dosym /lib/node_modules/npm/bin/npm-cli.js /bin/npm
}

src_test() {
	emake test || die
}
