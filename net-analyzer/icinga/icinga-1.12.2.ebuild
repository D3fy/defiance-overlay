# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/icinga/icinga-1.11.1.ebuild,v 1.1 2014/03/28 02:58:53 prometheanfire Exp $

EAPI=5

inherit eutils multilib toolchain-funcs user versionator

DESCRIPTION="Nagios Fork - Check daemon, CGIs, docs, IDOutils"
HOMEPAGE="http://www.icinga.org/"
#MY_PV=$(delete_version_separator 3)
#SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}.tar.gz"
#S=${WORKDIR}/${PN}-${MY_PV}
#SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/${PN}/${PN}-core/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="contrib eventhandler idoutils lighttpd mysql perfdata perl plugins postgres ssl +vim-syntax web"
DEPEND="idoutils? ( dev-db/libdbi-drivers[mysql?,postgres?] )
	perl? ( dev-lang/perl )
	virtual/mailx
	web? (
		media-libs/gd[jpeg,png]
		lighttpd? ( www-servers/lighttpd )
	)
	!net-analyzer/nagios-core"
RDEPEND="${DEPEND}
	plugins? ( net-analyzer/nagios-plugins )"
RESTRICT="test"

pkg_setup() {
	enewgroup icinga
	enewgroup icinga
	enewuser icinga -1 -1 /var/lib/icinga "icinga,icinga"
}

src_prepare() {
	epatch "${FILESDIR}/fix-prestripped-binaries-1.7.0.patch"
}

src_configure() {
	local myconf

	myconf="$(use_enable perl embedded-perl)
	$(use_with perl perlcache)
	$(use_enable idoutils)
	$(use_enable ssl)
	$(use_enable perfdata)
	--with-cgiurl=/icinga/cgi-bin
	--with-log-dir=/var/log/icinga
	--libdir=/usr/$(get_libdir)
	--bindir=/usr/sbin
	--sbindir=/usr/$(get_libdir)/icinga/cgi-bin
	--datarootdir=/usr/share/icinga/htdocs
	--localstatedir=/var/lib/icinga
	--sysconfdir=/etc/icinga
	--with-lockfile=/var/run/icinga/icinga.lock
	--with-temp-dir=/tmp/icinga
	--with-temp-file=/tmp/icinga/icinga.tmp
	--with-plugin-dir=/usr/$(get_libdir)/nagios/plugins"

	if use idoutils ; then
		myconf+=" --with-ido2db-lockfile=/var/run/icinga/ido2db.lock
		--with-icinga-chkfile=/var/lib/icinga/icinga.chk
		--with-ido-sockfile=/var/lib/icinga/ido.sock
		--with-idomod-tmpfile=/tmp/icinga/idomod.tmp"
	fi

	if use eventhandler ; then
		myconf+=" --with-eventhandler-dir=/etc/icinga/eventhandlers"
	fi

	if use lighttpd ; then
		myconf+=" --with-command-group=lighttpd"
	else
		myconf+=" --with-command-group=icinga"
	fi

	econf ${myconf}
}

src_compile() {
	tc-export CC

	emake icinga || die "make failed"

	if use web ; then
		emake DESTDIR="${D}" cgis || die
	fi

	if use contrib ; then
		emake DESTDIR="${D}" -C contrib || die
	fi

	if use idoutils ; then
		emake DESTDIR="${D}" idoutils || die
	fi
}

src_install() {
	dodoc Changelog README UPGRADING || die

	if ! use web ; then
		sed -i -e '/cd $(SRC_\(CGI\|HTM\))/d' Makefile || die
	fi

	emake DESTDIR="${D}" install{,-config,-commandmode} || die

	if use idoutils ; then
		 emake DESTDIR="${D}" install-idoutils || die
	fi

	if use contrib ; then
		emake DESTDIR="${D}" -C contrib install || die
	fi

	if use eventhandler ; then
		emake DESTDIR="${D}" install-eventhandlers || die
	fi

	doheader -r include/* || die
	newinitd "${FILESDIR}"/icinga-init.d icinga || die
	newconfd "${FILESDIR}"/icinga-conf.d icinga || die
	if use idoutils ; then
		newinitd "${FILESDIR}"/ido2db-init.d ido2db || die
		newconfd "${FILESDIR}"/ido2db-conf.d ido2db || die
		insinto /usr/share/icinga/contrib/db
		doins -r module/idoutils/db/* || die
	fi
	# Apache Module
	if use web ; then
		if use lighttpd ; then
			insinto /etc/lighttpd
			newins "${FILESDIR}"/icinga-lighty.conf lighttpd_icinga.conf || die
		else
			ewarn "${CATEGORY}/${PF} only supports Apache-2.x or Lighttpd webserver"
			ewarn "out-of-the-box. Since you are not using one of them, you"
			ewarn "have to configure your webserver accordingly yourself."
		fi
		fowners -R root:root /usr/$(get_libdir)/icinga || die
		cd "${D}" || die
		find usr/$(get_libdir)/icinga -type d -exec fperms 755 {} +
		find usr/$(get_libdir)/icinga/cgi-bin -type f -exec fperms 755 {} +
	fi

	if use eventhandler ; then
		dodir /etc/icinga/eventhandlers || die
		fowners icinga:icinga /etc/icinga/eventhandlers || die
	fi

	keepdir /etc/icinga
	keepdir /var/lib/icinga
	keepdir /var/lib/icinga/archives
	keepdir /var/lib/icinga/rw
	keepdir /var/lib/icinga/spool/checkresults

	if use lighttpd ; then
		webserver=lighttpd
	else
		webserver=icinga
	fi

	fowners icinga:icinga /var/lib/icinga || die "Failed chown of /var/lib/icinga"
	fowners -R icinga:${webserver} /var/lib/icinga/rw || die "Failed chown of /var/lib/icinga/rw"

	fperms 6755 /var/lib/icinga/rw || die "Failed Chmod of ${D}/var/lib/icinga/rw"
	fperms 0750 /etc/icinga || die "Failed chmod of ${D}/etc/icinga"
}

pkg_postinst() {
	if use web ; then
		elog "This does not include cgis that are perl-dependent"
		elog "Currently traceroute.cgi is perl-dependent"
		elog "Note that the user your webserver is running as needs"
		elog "read-access to /etc/icinga."
		elog
		if use lighttpd ; then
			elog "There are several possible solutions to accomplish this,"
			elog "choose the one you are most comfortable with:"
			elog
			elog "  usermod -G icinga lighttpd "
			elog "or"
			elog "  chown icinga:lighttpd /etc/icinga"
			elog "Also edit /etc/lighttpd/lighttpd.conf and add 'include \"lighttpd_icinga.conf\"'"
			elog
			elog "That will make icinga's web front end visable via"
			elog "http://localhost/icinga/"
			elog
		else
			elog "IMPORTANT: Do not forget to add the user your webserver"
			elog "is running as to the icinga group!"
		fi
	else
		ewarn "Please note that you have installed Icinga without web interface."
		ewarn "Please don't file any bugs about having no web interface when you do this."
		ewarn "Thank you!"
	fi
	elog
	elog "If you want icinga to start at boot time"
	elog "remember to execute:"
	elog "  rc-update add icinga default"
	elog
	elog "If your kernel has /proc protection, icinga"
	elog "will not be happy as it relies on accessing the proc"
	elog "filesystem. You can fix this by adding icinga into"
	elog "the group wheel, but this is not recomended."
	elog
	if [ -d "${ROOT}"/var/icinga ] ; then
		ewarn
		ewarn "/var/icinga was moved to /var/lib/icinga"
		ewarn "please move the files if this was an upgrade"
		if use idoutils ; then
			ewarn "and edit /etc/ido2db.cfg to change the location of the files"
			ewarn "it accesses"
			ewarn "update your db with the scripts under the directory"
			ewarn "/usr/share/icinga/contrib/db/"
		fi
		ewarn
		ewarn "The \"mv /var/icinga /var/lib/\" command works well to move the files"
		ewarn "remove /var/icinga afterwards to make this warning disappear"
	fi
}
