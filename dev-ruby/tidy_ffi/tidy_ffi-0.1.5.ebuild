# Distributed under the terms of the GNU General Public License v2

EAPI=4
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="a clean and simple tidy library"
HOMEPAGE="https://github.com/libc/tidy_ffi"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~*"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
