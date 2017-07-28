# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-r3

DESCRIPTION="An encryption and authentication library for ZeroMQ applications"
HOMEPAGE="http://curvezmq.org"
EGIT_REPO_URI="https://github.com/zeromq/libcurve"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"

DEPEND="
	dev-libs/libsodium
	net-libs/zeromq
	net-libs/czmq
"
RDEPEND="${DEPEND}"

AUTOTOOLS_AUTORECONF=yes
