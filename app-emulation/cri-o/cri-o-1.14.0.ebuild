# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/kubernetes-sigs/${PN}"

inherit golang-vcs-snapshot bash-completion-r1

ARCHIVE_URI="https://github.com/kubernetes-sigs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Lightweight container runtime for Kubernetes"
HOMEPAGE="http://cri-o.io/"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="btrfs device-mapper doc ostree seccomp selinux"

RDEPEND="
	net-misc/cni-plugins
	app-emulation/runc
	net-misc/socat
	sys-apps/iproute2
	net-firewall/iptables
	btrfs? ( sys-fs/btrfs-progs )
	device-mapper? ( sys-fs/lvm2 )
	ostree? ( dev-util/ostree )
	seccomp? ( sys-libs/libseccomp )
	selinux? ( sys-libs/libselinux )"
DEPEND="
	${RDEPEND}
	doc? ( dev-go/go-md2man )"

src_prepare() {
	default

	sed -e '/^GIT_/d' \
		-e 's/\$(GO)\ build/\$(GO)\ build\ -v/' \
		-i src/${EGO_PN}/Makefile || die
}

src_compile() {
	pushd src/${EGO_PN} || die
	BUILDTAGS=""
	use btrfs         || BUILDTAGS="${BUILDTAGS} exclude_graphdriver_btrfs"
	use device-mapper || BUILDTAGS="${BUILDTAGS} exclude_graphdriver_devicemapper"
	use ostree        || BUILDTAGS="${BUILDTAGS} containers_image_ostree_stub"
	use seccomp       && BUILDTAGS="${BUILDTAGS} seccomp"
	use selinux       && BUILDTAGS="${BUILDTAGS} selinux"
	mkdir -p bin || die "failed to create bin"
	#GOPATH="${S}" GOBIN="${S}/bin" \
	GOPATH="${GOPATH}:${S}" BASE_LDFLAGS=" -s -w -X main.gitCommit=${GIT_COMMIT} -X main.buildInfo=Gentoo" \
		emake BUILDTAGS="${BUILDTAGS}" bin/crio
	GOPATH="${GOPATH}:${S}" go build -v -i -ldflags '-s -w -X main.gitCommit=${GIT_COMMIT} -X main.buildInfo=Gentoo' \
		-o bin/crio-config ./cmd/crio-config
	./bin/crio-config && mv config.h conmon/
	BASE_LDFLAGS=" -s -w -X main.gitCommit=${GIT_COMMIT} -X main.buildInfo=Gentoo" \
		emake BUILDTAGS="${BUILDTAGS}" binaries

	if use doc; then emake docs; fi
}

src_install() {
	pushd src/${EGO_PN} || die

	emake DESTDIR="${D}" PREFIX="${D}${EPREFIX}/usr" install.bin
	use doc && emake DESTDIR="${D}" PREFIX="${D}${EPREFIX}/usr" install.man

	dodir   /etc/crio
	insinto /etc/crio
	doins   "${FILESDIR}/crio.conf"
	use seccomp && doins "${FILESDIR}/seccomp.json"
	dodir   /etc/crio/net.d
	insinto /etc/crio/net.d
	doins   "${FILESDIR}/99-loopback.conf"

	insinto /etc
	doins   "${FILESDIR}/crictl.yaml"

	newinitd "${FILESDIR}/${PN}.initd" crio
	newconfd "${FILESDIR}/${PN}.confd" crio

	dodir   /usr/share/containers/oci/hooks.d
	dodir   /var/lib/containers/storage
	keepdir /var/lib/containers/storage
}
