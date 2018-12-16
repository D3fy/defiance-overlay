# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot

DESCRIPTION="Terraform is a tool for building, changing, and combining infrastructure safely and efficiently."
HOMEPAGE="https://www.terraform.io/"

EGO_PN="github.com/hashicorp/${PN}"
ARCHIVE_URI="https://github.com/hashicorp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

SRC_URI="${ARCHIVE_URI}"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPENDS="dev-go/govendor"
DOCS=( CHANGELOG.md CONTRIBUTING.md README.md )

src_compile() {
	pushd src/${EGO_PN} || die
	path_orig=$PATH
	export PATH="${PATH}:${S}/bin"
	GOPATH="${S}" emake dev
	export PATH=$path_orig
	popd
}

src_install() {
	pushd src/${EGO_PN} || die
	dobin bin/${PN} || die
	popd
}
