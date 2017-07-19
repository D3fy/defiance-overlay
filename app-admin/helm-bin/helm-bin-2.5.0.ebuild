# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Kubernetes Package Manager"
HOMEPAGE="https://helm.sh/"
SRC_URI="https://storage.googleapis.com/kubernetes-${PN%-bin}/${PN%-bin}-v${PV}-linux-amd64.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/linux-amd64/

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN%-bin}
}
