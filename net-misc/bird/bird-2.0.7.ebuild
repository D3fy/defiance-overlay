# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 or IPv6"
HOMEPAGE="http://bird.network.cz"
SRC_URI="ftp://bird.network.cz/pub/${PN}/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+client debug mpls ssh"

RDEPEND="client? ( sys-libs/ncurses )
	client? ( sys-libs/readline )
	ssh? ( net-libs/libssh )"
DEPEND="sys-devel/flex
	sys-devel/bison
	sys-devel/m4"

PATCHES=(
	"${FILESDIR}/${P}-gcc10.patch"
)

src_configure() {
	econf \
		--localstatedir="${EPREFIX}/var" \
		$(use_enable client) \
		$(use_enable debug) \
		$(use_enable mpls mpls-kernel) \
		$(use_enable ssh libssh)
}

src_compile() {
	emake
}

src_install() {
	if use client; then
		dobin birdc
	fi
	dobin birdcl
	dosbin bird
	newinitd "${FILESDIR}/initd-${PN}-2" bird
	dodoc doc/bird.conf.example
}
