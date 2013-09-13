# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/diff-lcs/diff-lcs-1.2.4.ebuild,v 1.1 2013/05/01 05:44:15 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 jruby"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc History.rdoc"

inherit ruby-fakegem

DESCRIPTION="Use the McIlroy-Hunt LCS algorithm to compute differences"
HOMEPAGE="https://github.com/halostatue/diff-lcs"

LICENSE="|| ( MIT Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "doc? ( >=dev-ruby/hoe-2.10 )"

all_ruby_prepare() {
	# Remove unneeded rspec require to avoid rspec with USE=doc.
	sed -i -e "/require 'rspec'/d" Rakefile || die

	# Remove plugins since we don't need them for USE=doc.
	sed -i -e "/Hoe.plugin/ s:^:#:" Rakefile || die
}
