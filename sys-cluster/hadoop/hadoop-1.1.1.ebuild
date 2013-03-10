# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

WANT_ANT_TASKS="ant-core"

inherit eutils java-pkg-2 java-ant-2 autotools user

DESCRIPTION="Software framework for data intensive distributed applications"
HOMEPAGE="http://hadoop.apache.org/"
SRC_URI="https://archive.apache.org/dist/hadoop/core/${P}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="binchecks"
IUSE=""

DEPEND=">=virtual/jdk-1.6"
RDEPEND="${DEPEND}
	net-misc/openssh
	net-misc/rsync"

INSTALL_DIR=/opt/hadoop
export CONFIG_PROTECT="${CONFIG_PROTECT} ${INSTALL_DIR}/conf"

EANT_BUILD_TARGET="package"
JAVA_ANT_REWRITE_CLASSPATH="true"

pkg_setup() {
	java-pkg-2_pkg_setup
	enewgroup hadoop
	enewuser hadoop -1 /bin/sh /var/lib/hadoop hadoop
}

src_prepare() {
	java-pkg-2_src_prepare

	# really ugly. every attempt at injecting a classpath failed.
	for jar in $(java-pkg_getjars ant-core | sed 's/:/ /g'); do
		cp $jar "${S}"/lib/ || die
	done

	# do not build documentation
	sed -i -e '/target name="package"/s/depends=".*"/depends="compile, jar, examples"/' build.xml

	# cleanup before build
	eant clean
	mkdir -p "${S}"/build/docs

	#epatch "${FILESDIR}"/hadoop-java7.patch
	#epatch "${FILESDIR}"/hadoop-jni-ldflags.patch
	epatch "${FILESDIR}"/hadoop-noasneeded.patch
	cd "${S}"/src/native && eautoreconf
}

src_compile() {
	EANT_EXTRA_ARGS+=" -Divy.default.ivy.user.dir=${T}/ivy"
	EANT_EXTRA_ARGS+=" -Dcompile.native=true"
	java-pkg-2_src_compile
}

src_install() {
	cd "${S}"/build/hadoop-* || die

	# cleanup src and build leftovers
	rm -rf build.xml src/ ivy.xml ivy/ || die

	# The hadoop-env.sh file needs JAVA_HOME set explicitly
	sed -i -e "/export JAVA_HOME=/s:.*:export JAVA_HOME=/etc/java-config-2/current-system-vm:" conf/hadoop-env.sh || die "sed failed"

	dodir ${INSTALL_DIR}
	mv ./* "${D}${INSTALL_DIR}" || die "install failed"
	chown -Rf hadoop:hadoop "${D}${INSTALL_DIR}"

	# env file
	cat > 99hadoop <<-EOF
		PATH=${INSTALL_DIR}/bin
		ROOTPATH=${INSTALL_DIR}/bin
		CONFIG_PROTECT=${INSTALL_DIR}/conf
	EOF
	doenvd 99hadoop || die "doenvd failed"
}
