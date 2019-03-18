# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

DESCRIPTION="A fast and low-memory footprint OCI Container Runtime fully written in C"
HOMEPAGE="https://github.com/giuseppe/crun"
SRC_URI="https://github.com/giuseppe/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="selinux systemd static-libs"

DEPEND="
	dev-libs/yajl
	sys-libs/libseccomp
	selinux? ( sys-libs/libselinux )
	systemd? ( sys-apps/systemd )
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	econf \
		$(usex static-libs '--enabled-shared  --enabled-static' '--enable-shared --disable-static' '' '')
}
