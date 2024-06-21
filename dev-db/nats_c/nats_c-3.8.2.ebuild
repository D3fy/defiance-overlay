# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://github.com/nats-io/nats.c"
SRC_URI="https://github.com/nats-io/nats.c/archive/refs/tags/v${PV}.tar.gz"

S="${WORKDIR}/nats.c-${PV}"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="+sodium"
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=( )
	if use sodium; then
		mycmakeargs+=( -DNATS_BUILD_USE_SODIUM=ON )
	fi
	cmake_src_configure
}
