# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils user

DESCRIPTION="Jetty Web Server; Java Servlet container"

SLOT="9"
SRC_URI="http://git.eclipse.org/c/${PN}/org.eclipse.${PN}.project.git/snapshot/${P}.v20130625.tar.bz2 -> ${P}.tar.bz2"
HOMEPAGE="http://git.eclipse.org/c/jetty/org.eclipse.jetty.project.git"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"

IUSE="+logrotate"

DEPEND="dev-java/maven-bin:3.1
	virtual/jre:1.7"
RDEPEND="${CDEPEND}
	virtual/jdk:1.7"

S="${WORKDIR}/${P}.v20130625"


pkg_setup() {
	enewgroup jetty
	enewuser jetty 765 -1 /dev/null jetty
}

src_compile() {
	mkdir temp-repo
	mvn -Dmaven.repo.local="$PWD/temp-repo" -Dmaven.test.skip=true clean install
}

src_install() {
	cd jetty-distribution/target/distribution

	insinto /etc/${PN}
	doins etc/* start.ini
	doins -r resources start.d

	insinto /usr/share/${PN}
	for i in lib webapps webapps.demo; do
		doins -r "$i"
	done
	doins start.jar # Because of class-path java-pkg is not used

	keepdir /var/log/${PN}
	fowners jetty:jetty /var/log/${PN}
	fperms 0755 /etc/${PN} /var/log/${PN}

	dodoc LICENSE-* README* VERSION*

	use doc && dohtml javadoc

	newinitd "${FILESDIR}/$PN" $PN

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/${PN}.logrotate" $PN
	fi
}

src_test() {
	mvn test
}
