# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
AUTOTOOLS_AUTORECONF=yes

inherit autotools eutils user

SLOT="0"

LICENSE="GPL-3"
DESCRIPTION="The nifty configuration managment system"
HOMEPAGE="http://clockwork.niftylogic.com/"

SRC_URI="https://github.com/jhunt/clockwork/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

IUSE="clockd meshd vim-syntax test"

DEPEND="
	>=sys-devel/bison-3.0.0
	sys-devel/flex
	dev-libs/libpcre
	app-admin/augeas
	sys-libs/readline:*
	>=dev-libs/libvigor-1.2.6
	sys-apps/util-linux
	test? (
		dev-perl/Text-Diff
		dev-perl/File-Slurp
		dev-libs/ctap
	)
"
RDEPEND="
	dev-libs/libpcre
	app-admin/augeas
	sys-libs/readline:*
	>=dev-libs/libvigor-1.2.6
	dev-util/ccache
	app-portage/eix
	sys-apps/util-linux
"

src_prepare() {
	eapply_user
	eautoreconf
}

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
		dosym /etc/init.d/cogd /etc/init.d/clockd
		doins "${FILESDIR}"/clockd.conf
	fi

	if use meshd; then
		dosym /etc/init.d/cogd /etc/init.d/meshd
		doins "${FILESDIR}"/meshd.conf
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
		doins "${S}"/extras/vim/syntax/pnasm.vim
	fi
}

pkg_postinst() {
	elog "Generating a unique host UUID, to prevent network duplication"
	/usr/bin/cw uuid >/dev/null || die "Unable to run /usr/bin/cw uuid"
}
