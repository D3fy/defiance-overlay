# Distributed under the terms of the GNU General Public License v2

EAPI='5'
AUTOTOOLS_AUTORECONF=yes

inherit base autotools-utils eutils user

SLOT="0"

LICENSE="GPLv3"
DESCRIPTION="The nifty configuration managment system"
HOMEPAGE="http://clockwork.niftylogic.com/"

SRC_URI="https://github.com/filefrog/clockwork/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="*"

IUSE="clockd meshd vim-syntax"

DEPEND="
	>=sys-devel/bison-3.0.0
	sys-devel/flex
	dev-libs/libpcre
	app-admin/augeas
	>=dev-libs/libvigor-1.1.0
	>=dev-libs/ctap-1.1.5
	dev-util/ccache
	app-portage/eix
"
RDEPEND="${DEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD=1

pkg_setup() {
	enewgroup clock
	enewuser  clock -1 -1 /var/lib/clockwork clock
}

src_install() {
	emake DESTDIR="${D}" install

	dodir /etc/clockwork
	dodir /etc/clockwork/certs
	dodir /etc/clockwork/gather.d
	dodir /usr/lib/clockwork/state

	insinto /etc/clockwork
	newinitd "${FILESDIR}"/cogd.initd   cogd
	doins   "${FILESDIR}"/cogd.conf

	if use clockd; then
		newinitd "${FILESDIR}"/clockd.initd clockd
		doins   "${FILESDIR}"/clockd.conf
	fi

	if use meshd; then
		newinitd "${FILESDIR}"/meshd.initd  meshd
		doins   "${FILESDIR}"/meshd.conf
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/ftdetect
		doins "${S}"/extras/vim/ftdetect/clockwork.vim

		insinto /usr/share/vim/vimfiles/syntax
		doins "${S}"/extras/vim/syntax/clockwork.vim
		doins "${S}"/extras/vim/syntax/clockd.vim
		doins "${S}"/extras/vim/syntax/cogd.vim
		doins "${S}"/extras/vim/syntax/cwrc.vim
		doins "${S}"/extras/vim/syntax/meshd.vim
	fi
}

pkg_postinst() {
	elog "Generating a unique host UUID, to prevent network duplication"
	/usr/bin/cw uuid >/dev/null || die "Unable to run /usr/bin/cw uuid"
}
