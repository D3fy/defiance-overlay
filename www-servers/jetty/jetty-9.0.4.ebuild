# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils java-pkg-2

DESCRIPTION="Jetty Web Server; Java Servlet container"

SLOT="9"
SRC_URI="http://git.eclipse.org/c/${PN}/org.eclipse.${PN}.project.git/snapshot/${P}.v20130625.tar.bz2 -> ${P}.tar.bz2"
HOMEPAGE="http://git.eclipse.org/c/jetty/org.eclipse.jetty.project.git"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"

CDEPEND="dev-java/tomcat-servlet-api:2.5"
DEPEND="${CDEPEND}
	dev-java/slf4j-api
	>=virtual/jre:1.7"
RDEPEND="${CDEPEND}
	>=virtual/jdk-1.7"

S="${WORKDIR}/${P}"

src_prepare() {
	java-pkg_jar-from slf4j-api
	java-pkg_jar-from tomcat-servlet-api-2.5 servlet-api.jar
}

src_compile() {
	mkdir modules/util/bin || die
	ejavac -cp servlet-api.jar:slf4j-api.jar -d modules/util/bin \
			$(find modules/util/src/main/java -name '*.java')
	mkdir modules/jetty/bin || die
	ejavac -cp servlet-api.jar:modules/util/bin -d modules/jetty/bin \
			$(find modules/jetty/src/main/java -name '*.java')
}

src_install() {
	jar -cvf jetty-util.jar -C modules/util/bin . || die
	java-pkg_dojar jetty-util.jar
	jar -cvf jetty.jar -C modules/jetty/bin . || die
	java-pkg_dojar jetty.jar
}
