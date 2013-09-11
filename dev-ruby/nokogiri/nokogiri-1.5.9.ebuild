# Distributed under the terms of the GNU General Public License v2

EAPI=4
USE_RUBY="ruby19 ruby20 jruby"

inherit ruby-fakegem

DESCRIPTION="wrongdoc mangles an existing RDoc directory and makes any changes we feel like"
HOMEPAGE="http://bogomips.org/wrongdoc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~*"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
