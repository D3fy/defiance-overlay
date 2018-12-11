# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic multilib readme.gentoo-r1 vcs-snapshot cmake-utils

SRC_URI="https://github.com/rtrlib/rtrlib/archive/v${PV}.tar.gz"
KEYWORDS="amd64 x86"

DESCRIPTION="An open-source C implementation of the RPKI/Router Protocol client"
HOMEPAGE="http://rtrlib.realmv6.org/"

LICENSE="MIT"
SLOT="0"

IUSE="ssh"

COMMON_DEPEND="
	ssh? ( >=net-libs/libssh-0.5.0 )"
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

src_unpack() {
	unpack ${A}
	mv -v "${WORKDIR}/v${PV}" "${S}"
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	if ! use ssh; then
		CMAKE_BUILD_TYPE="NoSSH"
	fi
	cmake-utils_src_configure
}

src_install() {
	default
	cmake-utils_src_install
	prune_libtool_files
}
