# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="KAZEBURO"
inherit perl-module

DESCRIPTION="PSGI/Plack server with event driven connection manager, preforking workers"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/AnyEvent
	dev-perl/Plack
	dev-perl/Net-CIDR-Lite
	dev-perl/Parallel-Prefork
	dev-perl/libwww-perl
	dev-perl/Starlet
	dev-perl/POSIX-getpeername
	dev-perl/IO-FDPass

	dev-perl/EV
	dev-perl/HTTP-Parser-XS
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
