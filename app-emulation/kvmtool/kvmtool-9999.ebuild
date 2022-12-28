# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 toolchain-funcs linux-info linux-mod

DESCRIPTION="A lightweight tool for hosting KVM guests"
HOMEPAGE="https://github.com/kvmtool/kvmtool"
EGIT_REPO_URI="https://github.com/kvmtool/kvmtool.git"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

function ctarget() {
	CTARGET="${ARCH}"
	use amd64 && CTARGET='x86_64'
	echo $CTARGET
}

CONFIG_CHECK="VIRTIO VIRTIO_PCI
	SERIAL_8250 SERIAL_8250_CONSOLE
	VIRTIO_BLK VIRTIO_NET
	~VIRTIO_BALLOON
	~VIRTIO_CONSOLE
	~HW_RANDOM_VIRTIO
	~FB_VESA
"

pkg_setup() {
	linux-mod_pkg_setup
}

src_prepare() {
	eapply_user
	sed -e 's/^CFLAGS\t:=/CFLAGS := $(CFLAGS)/' \
		-e 's/^LDFLAGS\t:=/LDFLAGS := $(LDFLAGS)/' -i Makefile
}

src_compile() {
	V=1 ARCH=$(ctarget) emake
}

src_install() {
	dobin lkvm vm || die
	dodoc COPYING README Documentation/virtio-console.txt || die
	doman Documentation/${PN}.1
}
