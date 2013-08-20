# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rack-ssl/rack-ssl-1.3.3.ebuild,v 1.1 2013/01/30 07:26:08 graaff Exp $

EAPI=5
USE_RUBY="jruby ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem eutils versionator

DESCRIPTION="Force SSL/TLS in your app."
HOMEPAGE="https://github.com/josh/rack-ssl/"
SRC_URI="https://github.com/josh/rack-ssl/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"

ruby_add_rdepend "virtual/ruby-ssl"

ruby_add_bdepend "test? ( dev-ruby/rack-test )"
