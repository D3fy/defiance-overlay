# Distributed under the terms of the GNU General Public License v2

EAPI='5'
AUTOTOOLS_AUTORECONF=yes

inherit base autotools-utils eutils git-2 user

EGIT_REPO_URI="https://github.com/filefrog/clockwork"

if [[ ${PV} != 9999 ]] ; then
	# Set the commit ID
	EGIT_COMMIT="6579f4a2de573366c9e95347d97ec9b41a20f151"
	KEYWORDS="amd64 x86 x86-linux"
fi

SLOT="0"

LICENSE="CCLv3"
DESCRIPTION="The nifty configuration managment system"
HOMEPAGE="http://clockwork.niftylogic.com/"

IUSE="+vim-syntax"

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

	newinitd "${FILESDIR}"/clockd.initd clockd
	newinitd "${FILESDIR}"/cogd.initd   cogd
	newinitd "${FILESDIR}"/meshd.initd  meshd

	dodir /etc/clockwork
	dodir /etc/clockwork/certs
	dodir /etc/clockwork/gather.d

	insinto /etc/clockwork
	doins   "${FILESDIR}"/cogd.conf
	doins   "${FILESDIR}"/clockd.conf
	doins   "${FILESDIR}"/meshd.conf

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
