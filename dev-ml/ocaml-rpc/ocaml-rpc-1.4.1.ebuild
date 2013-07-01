# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit findlib eutils

IUSE="+ocamlopt"

DESCRIPTION="General command line syntax of GNU getopt and getopt_long, but is \
close to the spirit of the Arg module. "
SRC_URI="https://github.com/samoht/ocaml-rpc/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/samoht/ocaml-rpc"

DEPEND=">=dev-lang/ocaml-3.10.2[ocamlopt?]
	dev-ml/type-conv
	dev-ml/xmlm"

RDEPEND="$DEPEND"

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~amd64 ~ppc ~x86"

src_compile()
{
	emake || die "make failed"
	if use ocamlopt; then
		emake opt || die "make opt failed"
	fi
}

src_install()
{
	findlib_src_preinst
	emake install || die "make install failed"

	dodoc CHANGES README VERSION || die
}

