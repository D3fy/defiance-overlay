# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/kubernetes-incubator/${PN}"

inherit golang-vcs-snapshot bash-completion-r1

GIT_COMMIT="b97b9a3c7573d88d8616fe2d52aaade77b1690bd"

ARCHIVE_URI="https://github.com/kubernetes-incubator/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Lightweight container runtime for Kubernetes"
HOMEPAGE="http://cri-o.io/"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	net-misc/cni-plugins
	dev-go/go-md2man
	app-emulation/runc
	dev-util/ostree"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -e '/^GIT_/d' \
		-e 's/\$(GO)\ build/\$(GO)\ build\ -v/' \
		-i src/${EGO_PN}/Makefile || die
}

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}" GOBIN="${S}/bin" \
		BASE_LDFLAGS=" -s -w -X main.gitCommit=${GIT_COMMIT} -X main.buildInfo=Gentoo" \
		emake -j1 # -C "${S}/src/${EGO_PN}" dev
}

src_install() {
	pushd src/${EGO_PN} || die

	emake DESTDIR="${D}" PREFIX="${D}${EPREFIX}/usr" install
}
