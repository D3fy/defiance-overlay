# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6


EGO_PN="github.com/containernetworking/plugins"

inherit golang-vcs-snapshot bash-completion-r1

GIT_COMMIT="7480240de9749f9a0a5c8614b17f1f03e0c06ab9"

ARCHIVE_URI="https://github.com/containernetworking/plugins/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Some standard networking plugins, maintained by the CNI team"
HOMEPAGE="https://github.com/containernetworking/plugins"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	pushd src/${EGO_PN} || die
	local PLUGINS="plugins/meta/* plugins/main/* plugins/ipam/* plugins/sample"
	for d in $PLUGINS; do
		if [ -d "$d" ]; then
			plugin="$(basename "$d")"
			echo "Building ${plugin}"
			GOPATH="${S}" go build -v -x -o "bin/$plugin" -pkgdir "${GOPATH}/pkg" "${EGO_PN}/${d}"
		fi
	done
}

src_install() {
	exeinto /usr/libexec/cni
	doexe ${S}/src/${EGO_PN}/bin/*
}
