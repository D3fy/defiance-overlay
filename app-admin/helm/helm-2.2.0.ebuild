# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit user golang-build golang-vcs-snapshot

EGO_PN="k8s.io/helm/..."
ARCHIVE_URI="https://github.com/kubernetes/helm/archive/v${PV}.tar.gz -> helm-${PV}.tar.gz"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="The Kubernetes Package Manager"
HOMEPAGE="https://github.com/kubernetes/helm"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="test"

src_compile() {
	LDFLAGS="" GOPATH="${WORKDIR}/${P}" emake -j1 -C src/${EGO_PN%/*} WHAT=cmd/${PN}
}

src_install() {
	pushd src/${EGO_PN%/*} || die
	dobin _output/bin/${PN}
	popd || die
}
