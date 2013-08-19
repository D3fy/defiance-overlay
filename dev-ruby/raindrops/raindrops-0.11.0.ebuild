# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19 ruby20"

inherit ruby-fakegem

DESCRIPTION="real-time stats toolkit to show statistics for Rack HTTP servers"
HOMEPAGE="http://rubygems.org/gems/raindrops"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~*"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/raindrops extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/raindrops
	mv ext/raindrops/raindrops_ext.so lib/ || die
}
