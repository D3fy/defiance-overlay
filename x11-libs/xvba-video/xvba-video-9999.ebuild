# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="git://anongit.freedesktop.org/vaapi/xvba-driver"
[[ ${PV} = 9999 ]] && inherit git-2
inherit eutils autotools

DESCRIPTION="XVBA Backend for Video Acceleration (VA) API"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/vaapi"
# No source release yet, the src_uri is theoretical at best right now
[[ ${PV} = 9999 ]] || SRC_URI="http://www.freedesktop.org/software/vaapi/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-2+ MIT"
SLOT="0"
# newline is needed for broken ekeyword
[[ ${PV} = 9999 ]] || \
KEYWORDS="~amd64 ~x86"
IUSE="debug opengl"

RDEPEND="
	>=x11-libs/libva-1.1.0[X,opengl?]
	x11-libs/libvdpau
	x11-drivers/ati-drivers[vaapi]
"
DEPEND="${DEPEND}
	virtual/pkgconfig"

DOCS=( NEWS README AUTHORS )

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable opengl glx)
}

src_install() {
	default
	prune_libtool_files --all
}
