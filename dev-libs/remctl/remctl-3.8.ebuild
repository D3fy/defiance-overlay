# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_AUTORECONF=yes

inherit base autotools-utils eutils

DESCRIPTION="remctl is a client/server application that supports remote execution of specific commands"
HOMEPAGE="http://www.eyrie.org/~eagle/software/remctl/"
SRC_URI="https://github.com/rra/remctl/archive/release/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="kerberos pcre perl python php ruby"

DEPEND="
	kerberos? ( virtual/krb5 )
	pcre? ( dev-libs/libpcre )
	dev-libs/libevent
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-release-${PV}"

src_prepare() {
	pod2man --release="${PV}" --center="remctl" docs/remctl.pod > docs/remctl.1
	pod2man --release="${PV}" --center="remctl" --section=8 docs/remctld.pod \
		    > docs/remctld.8.in
	for doc in remctl remctl_close remctl_command remctl_error remctl_new \
		remctl_noop remctl_open remctl_output remctl_set_ccache \
		remctl_set_source_ip remctl_set_timeout ; do
		pod2man --release="${PV}" --center="remctl Library Reference" \
			--section=3 --name=`echo "$doc" | tr a-z A-Z` docs/api/"$doc".pod \
			> docs/api/"$doc".3
	done
	eautoreconf
}

src_configure() {
	local myconf
	econf \
		$myconf \
		$(use_with kerberos krb5) \
		$(use_with pcre) \
		$(use_enable perl) \
		$(use_enable python) \
		$(use_enable php) \
		$(use_enable ruby)
}
