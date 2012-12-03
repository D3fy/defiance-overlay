# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools eutils flag-o-matic user

DESCRIPTION="A persistent caching system, key-value and data structures database."
HOMEPAGE="http://redis.io/"
SRC_URI="http://redis.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86 ~x86-macos ~x86-solaris"
IUSE="jemalloc tcmalloc test"
SLOT="0"

RDEPEND="tcmalloc? ( dev-util/google-perftools )
	jemalloc? ( >=dev-libs/jemalloc-3.0 )"
DEPEND=">=sys-devel/autoconf-2.63
	test? ( dev-lang/tcl )
	${RDEPEND}"
REQUIRED_USE="tcmalloc? ( !jemalloc )
	jemalloc? ( !tcmalloc )"

S="${WORKDIR}/${PN}-${PV/_/-}"

REDIS_PIDDIR=/var/run/redis/
REDIS_PIDFILE=${REDIS_PIDDIR}/redis.pid
REDIS_DATAPATH=/var/lib/redis
REDIS_LOGPATH=/var/log/redis
REDIS_LOGFILE=${REDIS_LOGPATH}/redis.log

pkg_setup() {
	enewgroup redis 75
	enewuser redis 75 -1 ${REDIS_DATAPATH} redis
}

src_prepare() {
	# epatch "${FILESDIR}/redis-2.4.3-shared.patch"
	# epatch "${FILESDIR}/redis-2.4.4-tcmalloc.patch"
	if use jemalloc ; then
		sed -i -e "s/je_/j/" src/zmalloc.c src/zmalloc.h
	fi
	# now we will rewrite present Makefiles
	# local makefiles=""
	# for MKF in $(find -name 'Makefile' | cut -b 3-); do
	# 	mv "${MKF}" "${MKF}.in"
	# 	sed -i	-e 's:$(CC):@CC@:g' \
	# 		-e 's:$(CFLAGS):@AM_CFLAGS@:g' \
	# 		-e 's: $(DEBUG)::g' \
	# 		-e 's:$(OBJARCH)::g' \
	# 		-e 's:ARCH:TARCH:g' \
	# 		-e '/^CCOPT=/s:$: $(LDFLAGS):g' \
	# 		"${MKF}.in" \
	# 	|| die "Sed failed for ${MKF}"
	# 	makefiles+=" ${MKF}"
	# done
	# autodetection of compiler and settings; generates the modified Makefiles
	cp "${FILESDIR}"/configure.ac-2.2 configure.ac
	# sed -i	-e "s:AC_CONFIG_FILES(\[Makefile\]):AC_CONFIG_FILES([${makefiles}]):g" \
	# 	configure.ac || die "Sed failed for configure.ac"
	# econf
}

src_compile() {
	# local myconf=""

	if use tcmalloc ; then
		myconf="${myconf} USE_TCMALLOC=yes"
	elif use jemalloc ; then
		myconf="${myconf} JEMALLOC_SHARED=yes"
	else
		myconf="${myconf} FORCE_LIBC_MALLOC=yes"
	fi

	# emake ${myconf}
	emake 
}

src_install() {
	# configuration file rewrites
	insinto /etc/
	sed -r \
		-e "/^pidfile\>/s,/var.*,${REDIS_PIDFILE}," \
		-e '/^daemonize\>/s,no,yes,' \
		-e '/^# bind/s,^# ,,' \
		-e '/^# maxmemory\>/s,^# ,,' \
		-e '/^maxmemory\>/s,<bytes>,67108864,' \
		-e "/^dbfilename\>/s,dump.rdb,${REDIS_DATAPATH}/dump.rdb," \
		-e "/^dir\>/s, .*, ${REDIS_DATAPATH}/," \
		-e '/^loglevel\>/s:(verbose|debug):notice:' \
		-e "/^logfile\>/s:stdout:${REDIS_LOGFILE}:" \
		<redis.conf \
		>redis.conf.gentoo
	newins redis.conf.gentoo redis.conf
	use prefix || fowners redis:redis /etc/redis.conf
	fperms 0644 /etc/redis.conf

	newconfd "${FILESDIR}/redis.confd" redis
	newinitd "${FILESDIR}/redis.initd" redis

	nonfatal dodoc 00-RELEASENOTES BUGS CONTRIBUTING README

	dobin src/redis-cli
	dosbin src/redis-benchmark src/redis-server src/redis-check-aof src/redis-check-dump
	fperms 0750 /usr/sbin/redis-benchmark

	if use prefix; then
		diropts -m0750
	else
		diropts -m0750 -o redis -g redis
	fi
	keepdir ${REDIS_DATAPATH} ${REDIS_LOGPATH}
}
