# Distributed under the terms of the GNU General Public License v2

EAPI="5"

# Funtoo notes:
# test merge this way: NGINX_MODULES_HTTP="*" NGINX_MODULES_EMAIL="*" emerge nginx

# Maintainer notes:
# - http_rewrite-independent pcre-support makes sense for matching locations without an actual rewrite
# - any http-module activates the main http-functionality and overrides USE=-http
# - keep the following requirements in mind before adding external modules:
#   * alive upstream
#   * sane packaging
#   * builds cleanly
#   * does not need a patch for nginx core
# - TODO: test the google-perftools module (included in vanilla tarball)

# prevent perl-module from adding automagic perl DEPENDs
GENTOO_DEPEND_ON_PERL="no"

# syslog (https://github.com/yaoweibin/nginx_syslog_patch, BSD license)
SYSLOG_MODULE_PV="0.30"
SYSLOG_MODULE_NGINX_PV="1.7.0"
SYSLOG_MODULE_P="ngx_syslog-${SYSLOG_MODULE_PV}"
SYSLOG_MODULE_URI="https://github.com/graytshirt/nginx_syslog_patch/archive/v${SYSLOG_MODULE_PV}.tar.gz"
SYSLOG_MODULE_WD="${WORKDIR}/nginx_syslog_patch-${SYSLOG_MODULE_PV}"

# devel_kit (https://github.com/simpl/ngx_devel_kit, BSD license)
DEVEL_KIT_MODULE_PV="0.2.19"
DEVEL_KIT_MODULE_P="ngx_devel_kit-${DEVEL_KIT_MODULE_PV}"
DEVEL_KIT_MODULE_URI="https://github.com/simpl/ngx_devel_kit/archive/v${DEVEL_KIT_MODULE_PV}.tar.gz"
DEVEL_KIT_MODULE_WD="${WORKDIR}/ngx_devel_kit-${DEVEL_KIT_MODULE_PV}"

# http_uploadprogress (https://github.com/masterzen/nginx-upload-progress-module, BSD-2 license)
HTTP_UPLOAD_PROGRESS_MODULE_PV="0.9.1"
HTTP_UPLOAD_PROGRESS_MODULE_P="ngx_http_upload_progress-${HTTP_UPLOAD_PROGRESS_MODULE_PV}"
HTTP_UPLOAD_PROGRESS_MODULE_URI="https://github.com/masterzen/nginx-upload-progress-module/archive/v${HTTP_UPLOAD_PROGRESS_MODULE_PV}.tar.gz"
HTTP_UPLOAD_PROGRESS_MODULE_WD="${WORKDIR}/nginx-upload-progress-module-${HTTP_UPLOAD_PROGRESS_MODULE_PV}"

# http_headers_more (http://github.com/agentzh/headers-more-nginx-module, BSD license)
HTTP_HEADERS_MORE_MODULE_PV="0.25"
HTTP_HEADERS_MORE_MODULE_P="ngx_http_headers_more-${HTTP_HEADERS_MORE_MODULE_PV}"
HTTP_HEADERS_MORE_MODULE_URI="https://github.com/agentzh/headers-more-nginx-module/archive/v${HTTP_HEADERS_MORE_MODULE_PV}.tar.gz"
HTTP_HEADERS_MORE_MODULE_WD="${WORKDIR}/headers-more-nginx-module-${HTTP_HEADERS_MORE_MODULE_PV}"

# http_push (https://github.com/slact/nginx_http_push_module/, MIT license)
HTTP_PUSH_MODULE_PV="0.712"
HTTP_PUSH_MODULE_P="ngx_http_push_module-${HTTP_PUSH_MODULE_PV}"
HTTP_PUSH_MODULE_URI="https://github.com/slact/nginx_http_push_module/archive/v${HTTP_PUSH_MODULE_PV}.tar.gz"
HTTP_PUSH_MODULE_WD="${WORKDIR}/nginx_http_push_module-${HTTP_PUSH_MODULE_PV}"

# http_cache_purge (http://labs.frickle.com/nginx_ngx_cache_purge/, BSD-2 license)
HTTP_CACHE_PURGE_MODULE_PV="2.1"
HTTP_CACHE_PURGE_MODULE_P="ngx_http_cache_purge-${HTTP_CACHE_PURGE_MODULE_PV}"
HTTP_CACHE_PURGE_MODULE_URI="http://labs.frickle.com/files/ngx_cache_purge-${HTTP_CACHE_PURGE_MODULE_PV}.tar.gz"
HTTP_CACHE_PURGE_MODULE_WD="${WORKDIR}/ngx_cache_purge-${HTTP_CACHE_PURGE_MODULE_PV}"

# http_slowfs_cache (http://labs.frickle.com/nginx_ngx_slowfs_cache/, BSD-2 license)
HTTP_SLOWFS_CACHE_MODULE_PV="1.10"
HTTP_SLOWFS_CACHE_MODULE_P="ngx_http_slowfs_cache-${HTTP_SLOWFS_CACHE_MODULE_PV}"
HTTP_SLOWFS_CACHE_MODULE_URI="http://labs.frickle.com/files/ngx_slowfs_cache-${HTTP_SLOWFS_CACHE_MODULE_PV}.tar.gz"
HTTP_SLOWFS_CACHE_MODULE_WD="${WORKDIR}/ngx_slowfs_cache-${HTTP_SLOWFS_CACHE_MODULE_PV}"

# http_fancyindex (http://wiki.nginx.org/NgxFancyIndex, BSD license)
HTTP_FANCYINDEX_MODULE_PV="0.3.3"
HTTP_FANCYINDEX_MODULE_P="ngx_http_fancyindex-${HTTP_FANCYINDEX_MODULE_PV}"
HTTP_FANCYINDEX_MODULE_URI="https://github.com/aperezdc/ngx-fancyindex/archive/${HTTP_FANCYINDEX_MODULE_PV}.tar.gz"
HTTP_FANCYINDEX_MODULE_WD="${WORKDIR}/ngx-fancyindex-${HTTP_FANCYINDEX_MODULE_PV}"

# http_lua (https://github.com/chaoslawful/lua-nginx-module, BSD license)
HTTP_LUA_MODULE_PV="0.9.8"
HTTP_LUA_MODULE_P="ngx_http_lua-${HTTP_LUA_MODULE_PV}"
HTTP_LUA_MODULE_URI="https://github.com/openresty/lua-nginx-module/archive/v${HTTP_LUA_MODULE_PV}.tar.gz"
HTTP_LUA_MODULE_WD="${WORKDIR}/lua-nginx-module-${HTTP_LUA_MODULE_PV}"

# http_auth_pam (http://web.iti.upv.es/~sto/nginx/, unknown license)
HTTP_AUTH_PAM_MODULE_PV="1.3"
HTTP_AUTH_PAM_MODULE_P="ngx_http_auth_pam-${HTTP_AUTH_PAM_MODULE_PV}"
HTTP_AUTH_PAM_MODULE_URI="http://web.iti.upv.es/~sto/nginx/ngx_http_auth_pam_module-${HTTP_AUTH_PAM_MODULE_PV}.tar.gz"
HTTP_AUTH_PAM_MODULE_WD="${WORKDIR}/ngx_http_auth_pam_module-${HTTP_AUTH_PAM_MODULE_PV}"

# http_upstream_check (https://github.com/yaoweibin/nginx_upstream_check_module, BSD license)
HTTP_UPSTREAM_CHECK_MODULE_PV="0.1.9"
HTTP_UPSTREAM_CHECK_MODULE_P="ngx_http_upstream_check-${HTTP_UPSTREAM_CHECK_MODULE_PV}"
HTTP_UPSTREAM_CHECK_MODULE_URI="https://github.com/yaoweibin/nginx_upstream_check_module/archive/v${HTTP_UPSTREAM_CHECK_MODULE_PV}.tar.gz"
HTTP_UPSTREAM_CHECK_MODULE_WD="${WORKDIR}/nginx_upstream_check_module-${HTTP_UPSTREAM_CHECK_MODULE_PV}"

# http_metrics (https://github.com/madvertise/ngx_metrics, BSD license)
HTTP_METRICS_MODULE_PV="0.1.1"
HTTP_METRICS_MODULE_P="ngx_metrics-${HTTP_METRICS_MODULE_PV}"
HTTP_METRICS_MODULE_URI="https://github.com/madvertise/ngx_metrics/archive/${HTTP_METRICS_MODULE_PV}.tar.gz"
HTTP_METRICS_MODULE_WD="${WORKDIR}/ngx_metrics-${HTTP_METRICS_MODULE_PV}"

# naxsi-core (https://github.com/nbs-system/naxsi, GPLv2+)
HTTP_NAXSI_MODULE_PV="0.53-2"
HTTP_NAXSI_MODULE_P="ngx_http_naxsi-${HTTP_NAXSI_MODULE_PV}"
HTTP_NAXSI_MODULE_URI="https://github.com/nbs-system/naxsi/archive/${HTTP_NAXSI_MODULE_PV}.tar.gz"
HTTP_NAXSI_MODULE_WD="${WORKDIR}/naxsi-${HTTP_NAXSI_MODULE_PV}/naxsi_src"

# nginx-rtmp-module (https://github.com/arut/nginx-rtmp-module, BSD license)
RTMP_MODULE_PV="v1.1.4"
RTMP_MODULE_P="ngx_rtmp-${RTMP_MODULE_PV}"
RTMP_MODULE_URI="https://github.com/arut/nginx-rtmp-module/archive/${RTMP_MODULE_PV}.tar.gz"
RTMP_MODULE_WD="${WORKDIR}/nginx-rtmp-module-${RTMP_MODULE_PV}"

# nginx-dav-ext-module (https://github.com/arut/nginx-dav-ext-module, BSD license)
HTTP_DAV_EXT_MODULE_PV="0.0.3"
HTTP_DAV_EXT_MODULE_P="ngx_http_dav_ext-${HTTP_DAV_EXT_MODULE_PV}"
HTTP_DAV_EXT_MODULE_URI="https://github.com/arut/nginx-dav-ext-module/archive/${HTTP_DAV_EXT_MODULE_PV}.tar.gz"
HTTP_DAV_EXT_MODULE_WD="${WORKDIR}/nginx-dav-ext-module-${HTTP_DAV_EXT_MODULE_PV}"

# accept language module (http://wiki.nginx.org/AcceptLanguageModule, unknown license)
HTTP_ACCEPT_LANGUAGE_MODULE_PV="2f69842f83dac77f7d98b41a2b31b13b87aeaba7"
HTTP_ACCEPT_LANGUAGE_MODULE_P="ngx_accept_language_module-${HTTP_ACCEPT_LANGUAGE_MODULE_PV}"
HTTP_ACCEPT_LANGUAGE_MODULE_URI="https://github.com/giom/nginx_accept_language_module/archive/${HTTP_ACCEPT_LANGUAGE_MODULE_PV}.tar.gz"
HTTP_ACCEPT_LANGUAGE_MODULE_WD="${WORKDIR}/nginx_accept_language_module-${HTTP_ACCEPT_LANGUAGE_MODULE_PV}"

# AccessKey (http://wiki.nginx.org/HttpAccessKeyModule, unknown license)
HTTP_ACCESSKEY_MODULE_PV="2.0.3"
HTTP_ACCESSKEY_MODULE_P="ngx_accesskey-${HTTP_ACCESSKEY_MODULE_PV}"
HTTP_ACCESSKEY_MODULE_URI="http://wiki.nginx.org/images/5/51/Nginx-accesskey-${HTTP_ACCESSKEY_MODULE_PV}.tar.gz"
HTTP_ACCESSKEY_MODULE_WD="${WORKDIR}/nginx-accesskey-${HTTP_ACCESSKEY_MODULE_PV}"

# HTTP concat module (http://wiki.nginx.org/HttpConcatModule, 2-clause)
HTTP_CONCAT_MODULE_PV="1.2.2"
HTTP_CONCAT_MODULE_P="ngx_http_concat_module-${HTTP_CONCAT_MODULE_PV}"
HTTP_CONCAT_MODULE_URI="https://github.com/alibaba/nginx-http-concat/archive/${HTTP_CONCAT_MODULE_PV}.tar.gz"
HTTP_CONCAT_MODULE_WD="${WORKDIR}/nginx-http-concat-${HTTP_CONCAT_MODULE_PV}"

# RRD graph
HTTP_RRD_GRAPH_MODULE_PV="0.2.0"
HTTP_RRD_GRAPH_MODULE_P="ngx_http_rrd_graph_module-${HTTP_RRD_GRAPH_MODULE_PV}"
HTTP_RRD_GRAPH_MODULE_URI="http://wiki.nginx.org/images/5/51/Mod_rrd_graph-${HTTP_RRD_GRAPH_MODULE_PV}.tar.gz"
HTTP_RRD_GRAPH_MODULE_WD="${WORKDIR}/mod_rrd_graph-${HTTP_RRD_GRAPH_MODULE_PV}"

# echo-nginx-module (https://github.com/agentzh/echo-nginx-module, BSD license)
HTTP_ECHO_MODULE_PV="0.53"
HTTP_ECHO_MODULE_P="ngx_http_echo-${HTTP_ECHO_MODULE_PV}"
HTTP_ECHO_MODULE_URI="https://github.com/openresty/echo-nginx-module/archive/v${HTTP_ECHO_MODULE_PV}.tar.gz"
HTTP_ECHO_MODULE_WD="${WORKDIR}/echo-nginx-module-${HTTP_ECHO_MODULE_PV}"

# mod_security for nginx (https://modsecurity.org/, Apache-2.0)
# keep the MODULE_P here consistent with upstream to avoid tarball duplication
HTTP_SECURITY_MODULE_PV="2.8.0"
HTTP_SECURITY_MODULE_P="modsecurity-apache_${HTTP_SECURITY_MODULE_PV}"
HTTP_SECURITY_MODULE_URI="https://www.modsecurity.org/tarball/${HTTP_SECURITY_MODULE_PV}/${HTTP_SECURITY_MODULE_P}.tar.gz"
HTTP_SECURITY_MODULE_WD="${WORKDIR}/${HTTP_SECURITY_MODULE_P}"

# push-stream-module (https://github.com/wandenberg/nginx-push-stream-module, GPL-3)
HTTP_PUSH_STREAM_MODULE_PV="0.4.0"
HTTP_PUSH_STREAM_MODULE_P="ngx_http_push_stream-${HTTP_PUSH_STREAM_MODULE_PV}"
HTTP_PUSH_STREAM_MODULE_URI="https://github.com/wandenberg/nginx-push-stream-module/archive/${HTTP_PUSH_STREAM_MODULE_PV}.tar.gz"
HTTP_PUSH_STREAM_MODULE_WD="${WORKDIR}/nginx-push-stream-module-${HTTP_PUSH_STREAM_MODULE_PV}"

inherit eutils ssl-cert toolchain-funcs perl-module flag-o-matic user versionator

DESCRIPTION="Robust, small and high performance http and reverse proxy server"
HOMEPAGE="http://nginx.org"

# switched ey-balancer from ry's overlay to msva's :)
SRC_URI="http://nginx.org/download/${P}.tar.gz
        syslog? ( ${SYSLOG_MODULE_URI} -> ${SYSLOG_MODULE_P}.tar.gz )
        nginx_modules_http_upload_progress? ( ${HTTP_UPLOAD_PROGRESS_MODULE_URI} -> ${HTTP_UPLOAD_PROGRESS_MODULE_P}.tar.gz )
        nginx_modules_http_headers_more? ( ${HTTP_HEADERS_MORE_MODULE_URI} -> ${HTTP_HEADERS_MORE_MODULE_P}.tar.gz )
        nginx_modules_http_push? ( ${HTTP_PUSH_MODULE_URI} -> ${HTTP_PUSH_MODULE_P}.tar.gz )
        nginx_modules_http_cache_purge? ( ${HTTP_CACHE_PURGE_MODULE_URI} -> ${HTTP_CACHE_PURGE_MODULE_P}.tar.gz )
        nginx_modules_http_slowfs_cache? ( ${HTTP_SLOWFS_CACHE_MODULE_URI} -> ${HTTP_SLOWFS_CACHE_MODULE_P}.tar.gz )
        nginx_modules_http_fancyindex? ( ${HTTP_FANCYINDEX_MODULE_URI} -> ${HTTP_FANCYINDEX_MODULE_P}.tar.gz )
        nginx_modules_http_lua? ( ${HTTP_LUA_MODULE_URI} -> ${HTTP_LUA_MODULE_P}.tar.gz )
        nginx_modules_http_auth_pam? ( ${HTTP_AUTH_PAM_MODULE_URI} -> ${HTTP_AUTH_PAM_MODULE_P}.tar.gz )
		nginx_modules_http_upstream_check? ( ${HTTP_UPSTREAM_CHECK_MODULE_URI} -> ${HTTP_UPSTREAM_CHECK_MODULE_P}.tar.gz )
        nginx_modules_http_metrics? ( ${HTTP_METRICS_MODULE_URI} -> ${HTTP_METRICS_MODULE_P}.tar.gz )
        nginx_modules_http_naxsi? ( ${HTTP_NAXSI_MODULE_URI} -> ${HTTP_NAXSI_MODULE_P}.tar.gz )
        rtmp? ( ${RTMP_MODULE_URI} -> ${RTMP_MODULE_P}.tar.gz )
        nginx_modules_http_dav_ext? ( ${HTTP_DAV_EXT_MODULE_URI} -> ${HTTP_DAV_EXT_MODULE_P}.tar.gz )
        nginx_modules_http_accept_language? ( ${HTTP_ACCEPT_LANGUAGE_MODULE_URI} -> ${HTTP_ACCEPT_LANGUAGE_MODULE_P}.tar.gz )
        nginx_modules_http_accesskey? ( ${HTTP_ACCESSKEY_MODULE_URI} -> ${HTTP_ACCESSKEY_MODULE_P}.tar.gz )
        nginx_modules_http_concat? ( ${HTTP_CONCAT_MODULE_URI} -> ${HTTP_CONCAT_MODULE_P}.tar.gz )
        nginx_modules_http_rrd_graph? ( ${HTTP_RRD_GRAPH_MODULE_URI} -> ${HTTP_RRD_GRAPH_MODULE_P}.tar.gz )
        ${DEVEL_KIT_MODULE_URI} -> ${DEVEL_KIT_MODULE_P}.tar.gz
	nginx_modules_http_echo? ( ${HTTP_ECHO_MODULE_URI} -> ${HTTP_ECHO_MODULE_P}.tar.gz )
	nginx_modules_http_security? ( ${HTTP_SECURITY_MODULE_URI} -> ${HTTP_SECURITY_MODULE_P}.tar.gz )
	nginx_modules_http_push_stream? ( ${HTTP_PUSH_STREAM_MODULE_URI} -> ${HTTP_PUSH_STREAM_MODULE_P}.tar.gz )"

LICENSE="as-is BSD BSD-2 GPL-2 MIT SSLeay GPL-2+ Apache-2.0 GPL-3"
SLOT="0"
KEYWORDS="*"

NGINX_MODULES_STD="access auth_basic autoindex browser charset empty_gif fastcgi
geo gzip limit_req limit_conn limit_zone map memcached proxy referer rewrite scgi ssi
split_clients upstream_ip_hash userid uwsgi"
NGINX_MODULES_OPT="addition dav degradation flv geoip gunzip gzip_static image_filter
mp4 perl random_index realip secure_link spdy stub_status sub xslt"
NGINX_MODULES_MAIL="imap pop3 smtp"
NGINX_MODULES_3RD="
        http_upload_progress
        http_headers_more
        http_push
        http_cache_purge
        http_slowfs_cache
        http_fancyindex
        http_lua
        http_auth_pam
		http_upstream_check
        http_metrics
        http_naxsi
        http_dav_ext
        http_accept_language
        http_accesskey
        http_concat
        http_rrd_graph
	http_echo
	http_security
	http_push_stream"

IUSE="aio debug +http +http-cache ipv6 libatomic +pcre pcre-jit rtmp selinux ssl
syslog userland_GNU vim-syntax"

for mod in $NGINX_MODULES_STD; do
	IUSE="${IUSE} +nginx_modules_http_${mod}"
done

for mod in $NGINX_MODULES_OPT; do
	IUSE="${IUSE} nginx_modules_http_${mod}"
done

for mod in $NGINX_MODULES_MAIL; do
	IUSE="${IUSE} nginx_modules_mail_${mod}"
done

for mod in $NGINX_MODULES_3RD; do
	IUSE="${IUSE} nginx_modules_${mod}"
done

CDEPEND="
	pcre? ( >=dev-libs/libpcre-4.2 )
	pcre-jit? ( >=dev-libs/libpcre-8.20[jit] )
	selinux? ( sec-policy/selinux-nginx )
	ssl? ( dev-libs/openssl )
	http-cache? ( userland_GNU? ( dev-libs/openssl ) )
	nginx_modules_http_geo? ( dev-libs/geoip )
	nginx_modules_http_gunzip? ( sys-libs/zlib )
	nginx_modules_http_gzip? ( sys-libs/zlib )
	nginx_modules_http_gzip_static? ( sys-libs/zlib )
	nginx_modules_http_image_filter? ( media-libs/gd[jpeg,png] )
	nginx_modules_http_perl? ( >=dev-lang/perl-5.8 )
	nginx_modules_http_rewrite? ( >=dev-libs/libpcre-4.2 )
	nginx_modules_http_secure_link? ( userland_GNU? ( dev-libs/openssl ) )
	nginx_modules_http_spdy? ( >=dev-libs/openssl-1.0.1c )
	nginx_modules_http_xslt? ( dev-libs/libxml2 dev-libs/libxslt )
	nginx_modules_http_lua? ( || ( dev-lang/lua dev-lang/luajit ) )
   	nginx_modules_http_auth_pam? ( virtual/pam )
	nginx_modules_http_metrics? ( dev-libs/yajl )
	nginx_modules_http_dav_ext? ( dev-libs/expat )
	nginx_modules_http_rrd_graph? ( >=net-analyzer/rrdtool-1.4.8 )
	nginx_modules_http_security? ( >=dev-libs/libxml2-2.7.8 dev-libs/apr-util www-servers/apache )"

# this new pam has higher resource limits for open files that this nginx depends
# upon:

RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	arm? ( dev-libs/libatomic_ops )
	libatomic? ( dev-libs/libatomic_ops )"
PDEPEND="vim-syntax? ( app-vim/nginx-syntax )"

REQUIRED_USE="pcre-jit? ( pcre )
	nginx_modules_http_lua? ( nginx_modules_http_rewrite )
	nginx_modules_http_naxsi? ( pcre )
	nginx_modules_http_dav_ext? ( nginx_modules_http_dav )
	nginx_modules_http_metrics? ( nginx_modules_http_stub_status )
	nginx_modules_http_security? ( pcre )
	nginx_modules_http_push_stream? ( ssl )"

pkg_setup() {
	NGINX_HOME="/var/lib/nginx"
	NGINX_HOME_TMP="${NGINX_HOME}/tmp"

	ebegin "Creating nginx user and group"
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "${NGINX_HOME}" ${PN}
	eend ${?}

	if use libatomic; then
		ewarn "GCC 4.1+ features built-in atomic operations."
		ewarn "Using libatomic_ops is only needed if using"
		ewarn "a different compiler or a GCC prior to 4.1"
	fi

	if [[ -n $NGINX_ADD_MODULES ]]; then
		ewarn "You are building custom modules via \$NGINX_ADD_MODULES!"
		ewarn "This nginx installation is not supported!"
		ewarn "Make sure you can reproduce the bug without those modules"
		ewarn "_before_ reporting bugs."
	fi

	if use !http; then
		ewarn "To actually disable all http-functionality you also have to disable"
		ewarn "all nginx http modules."
	fi
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.4.1-fix-perl-install-path.patch"

	if use nginx_modules_http_upstream_check; then
		epatch "${FILESDIR}"/check-1.7.2+.patch
	fi

	if use syslog; then
		epatch "${SYSLOG_MODULE_WD}"/syslog_${SYSLOG_MODULE_NGINX_PV}.patch
	fi

	if use nginx_modules_http_security; then
		cd "${HTTP_SECURITY_MODULE_WD}/nginx/modsecurity"
		epatch "${FILESDIR}/modsecurity-${HTTP_SECURITY_MODULE_PV}-include-paths.patch"
		cd -
	fi

	find auto/ -type f -print0 | xargs -0 sed -i 's:\&\& make:\&\& \\$(MAKE):' || die
	# We have config protection, don't rename etc files
	sed -i 's:.default::' auto/install || die
	# remove useless files
	sed -i -e '/koi-/d' -e '/win-/d' auto/install || die

	# don't install to /etc/nginx/ if not in use
	local module
	for module in fastcgi scgi uwsgi ; do
		if ! use nginx_modules_http_${module}; then
			sed -i -e "/${module}/d" auto/install || die
		fi
	done

	epatch_user
}

src_configure() {
	local myconf= http_enabled= mail_enabled=

	use aio && myconf+=" --with-file-aio --with-aio_module"
	use debug && myconf+=" --with-debug"
	use ipv6 && myconf+=" --with-ipv6"
	use libatomic && myconf+=" --with-libatomic"
	use pcre && myconf+=" --with-pcre"
	use pcre-jit && myconf+=" --with-pcre-jit"

	# syslog support
	if use syslog; then
		myconf+=" --add-module=${SYSLOG_MODULE_WD}"
	fi

	# HTTP modules
	for mod in $NGINX_MODULES_STD; do
		if use nginx_modules_http_${mod}; then
			http_enabled=1
		else
			myconf+=" --without-http_${mod}_module"
		fi
	done

	for mod in $NGINX_MODULES_OPT; do
		if use nginx_modules_http_${mod}; then
			http_enabled=1
			myconf+=" --with-http_${mod}_module"
		fi
	done

	if use nginx_modules_http_fastcgi; then
		myconf+=" --with-http_realip_module"
	fi

	# third-party modules
	if use nginx_modules_http_upload_progress; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_UPLOAD_PROGRESS_MODULE_WD}"
	fi

	if use nginx_modules_http_headers_more; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_HEADERS_MORE_MODULE_WD}"
	fi

	if use nginx_modules_http_push; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_PUSH_MODULE_WD}"
	fi

	if use nginx_modules_http_cache_purge; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_CACHE_PURGE_MODULE_WD}"
	fi

	if use nginx_modules_http_slowfs_cache; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_SLOWFS_CACHE_MODULE_WD}"
	fi

	if use nginx_modules_http_fancyindex; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_FANCYINDEX_MODULE_WD}"
	fi

	if use nginx_modules_http_lua; then
		http_enabled=1
		myconf+=" --add-module=${DEVEL_KIT_MODULE_WD}"
		myconf+=" --add-module=${HTTP_LUA_MODULE_WD}"
	fi

	if use nginx_modules_http_auth_pam; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_AUTH_PAM_MODULE_WD}"
	fi

	if use nginx_modules_http_upstream_check; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_UPSTREAM_CHECK_MODULE_WD}"
	fi

	if use nginx_modules_http_metrics; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_METRICS_MODULE_WD}"
	fi

	if use nginx_modules_http_naxsi; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_NAXSI_MODULE_WD}"
	fi

	if use rtmp; then
		http_enabled=1
		myconf+=" --add-module=${RTMP_MODULE_WD}"
	fi

	if use nginx_modules_http_dav_ext; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_DAV_EXT_MODULE_WD}"
	fi

	if use nginx_modules_http_accept_language; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_ACCEPT_LANGUAGE_MODULE_WD}"
	fi

	if use nginx_modules_http_accesskey; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_ACCESSKEY_MODULE_WD}"
	fi

	if use nginx_modules_http_concat; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_CONCAT_MODULE_WD}"
	fi

	if use nginx_modules_http_rrd_graph; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_RRD_GRAPH_MODULE_WD}"
	fi

	if use nginx_modules_http_echo ; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_ECHO_MODULE_WD}"
	fi

	if use nginx_modules_http_security ; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_SECURITY_MODULE_WD}/nginx/modsecurity"
	fi

	if use nginx_modules_http_push_stream ; then
		http_enabled=1
		myconf+=" --add-module=${HTTP_PUSH_STREAM_MODULE_WD}"
	fi

	if use http || use http-cache; then
		http_enabled=1
	fi

	if [ $http_enabled ]; then
		use http-cache || myconf+=" --without-http-cache"
		use ssl && myconf+=" --with-http_ssl_module"
	else
		myconf+=" --without-http --without-http-cache"
	fi

	# MAIL modules
	for mod in $NGINX_MODULES_MAIL; do
		if use nginx_modules_mail_${mod}; then
			mail_enabled=1
		else
			myconf+=" --without-mail_${mod}_module"
		fi
	done

	if [ $mail_enabled ]; then
		myconf+=" --with-mail"
		use ssl && myconf+=" --with-mail_ssl_module"
	fi

	# custom modules
	for mod in $NGINX_ADD_MODULES; do
		myconf+=" --add-module=${mod}"
	done

	# https://bugs.gentoo.org/286772
	export LANG=C LC_ALL=C
	tc-export CC

	if ! use prefix; then
		myconf+=" --user=${PN} --group=${PN}"
	fi

	./configure \
		--prefix="${EPREFIX}"/usr \
		--conf-path="${EPREFIX}"/etc/${PN}/${PN}.conf \
		--error-log-path="${EPREFIX}"/var/log/${PN}/error_log \
		--pid-path="${EPREFIX}"/run/${PN}.pid \
		--lock-path="${EPREFIX}"/run/lock/${PN}.lock \
		--with-cc-opt="-I${EROOT}usr/include" \
		--with-ld-opt="-L${EROOT}usr/lib" \
		--http-log-path="${EPREFIX}"/var/log/${PN}/access_log \
		--http-client-body-temp-path="${EPREFIX}/${NGINX_HOME_TMP}"/client \
		--http-proxy-temp-path="${EPREFIX}/${NGINX_HOME_TMP}"/proxy \
		--http-fastcgi-temp-path="${EPREFIX}/${NGINX_HOME_TMP}"/fastcgi \
		--http-scgi-temp-path="${EPREFIX}/${NGINX_HOME_TMP}"/scgi \
		--http-uwsgi-temp-path="${EPREFIX}/${NGINX_HOME_TMP}"/uwsgi \
		${myconf} || die "configure failed"

	if use nginx_modules_http_security; then
		cd "${HTTP_SECURITY_MODULE_WD}"
		./configure \
				--enable-standalone-module \
				$(use_enable pcre-jit) \
				$(use_with nginx_modules_http_lua lua) || die "configure failed for mod_seciruty"
	fi
}

src_compile() {
	use nginx_modules_http_security && emake -C "${HTTP_SECURITY_MODULE_WD}"

	# https://bugs.gentoo.org/286772
	export LANG=C LC_ALL=C
	emake LINK="${CC} ${LDFLAGS}" OTHERLDFLAGS="${LDFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" install

	cp "${FILESDIR}"/${PVR}/nginx.conf "${ED}"/etc/nginx/nginx.conf || die

	newinitd "${FILESDIR}"/${PVR}/nginx.initd nginx

	cp "${FILESDIR}"/${PVR}/nginx.conf "${ED}"/etc/nginx/nginx.conf || die
	rm conf/win-utf conf/koi-win conf/koi-utf

	dodir /etc/${PN}/sites-{available,enabled}
	insinto /etc/${PN}/sites-available
	doins "${FILESDIR}/${PVR}"/sites-available/localhost
	dodir /usr/share/nginx/html
	insinto /usr/share/nginx/html
	doins ${FILESDIR}/example/index.html
	doins ${FILESDIR}/example/nginx-logo.png
	doins ${FILESDIR}/example/powered-by-funtoo.png

	doman man/nginx.8
	dodoc CHANGES* README

	rm -rf "${D}"/usr/html || die

	# set up a list of directories to keep
	local keepdir_list="${NGINX_HOME_TMP}"/client
	local module
	for module in proxy fastcgi scgi uwsgi; do
		use nginx_modules_http_${module} && keepdir_list+=" ${NGINX_HOME_TMP}/${module}"
	done

	keepdir /var/log/nginx ${keepdir_list}

	# this solves a problem with SELinux where nginx doesn't see the directories
	# as root and tries to create them as nginx
	fperms 0750 "${NGINX_HOME_TMP}"
	fowners ${PN}:0 "${NGINX_HOME_TMP}"

	fperms 0700 /var/log/nginx ${keepdir_list}
	fowners ${PN}:${PN} /var/log/nginx ${keepdir_list}
	# logrotate
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/nginx.logrotate nginx

	if use nginx_modules_http_perl; then
		cd "${S}"/objs/src/http/modules/perl/
		einstall DESTDIR="${D}" INSTALLDIRS=vendor
		fixlocalpod
	fi

	if use syslog; then
		docinto ${SYSLOG_MODULE_P}
		dodoc "${SYSLOG_MODULE_WD}"/README
	fi

	if use nginx_modules_http_push; then
		docinto ${HTTP_PUSH_MODULE_P}
		dodoc "${HTTP_PUSH_MODULE_WD}"/{changelog.txt,protocol.txt,README}
	fi

	if use nginx_modules_http_cache_purge; then
		docinto ${HTTP_CACHE_PURGE_MODULE_P}
		dodoc "${HTTP_CACHE_PURGE_MODULE_WD}"/{CHANGES,README.md,TODO.md}
	fi

	if use nginx_modules_http_slowfs_cache; then
		docinto ${HTTP_SLOWFS_CACHE_MODULE_P}
		dodoc "${HTTP_SLOWFS_CACHE_MODULE_WD}"/{CHANGES,README.md}
	fi

	if use nginx_modules_http_fancyindex; then
		docinto ${HTTP_FANCYINDEX_MODULE_P}
		dodoc "${HTTP_FANCYINDEX_MODULE_WD}"/README.rst
	fi

	if use nginx_modules_http_lua; then
		docinto ${HTTP_LUA_MODULE_P}
		dodoc "${HTTP_LUA_MODULE_WD}"/{Changes,README.markdown}
	fi

	if use nginx_modules_http_auth_pam; then
		docinto ${HTTP_AUTH_PAM_MODULE_P}
		dodoc "${HTTP_AUTH_PAM_MODULE_WD}"/{README,ChangeLog}
	fi

	if use nginx_modules_http_upstream_check; then
		docinto ${HTTP_UPSTREAM_CHECK_MODULE_P}
		dodoc "${HTTP_UPSTREAM_CHECK_MODULE_WD}"/{README,CHANGES}
	fi

# README.md is still empty
#	if use nginx_modules_http_metrics; then
#		docinto ${HTTP_METRICS_MODULE_P}
#		dodoc "${HTTP_METRICS_MODULE_WD}"/README.md
#	fi

	if use nginx_modules_http_naxsi; then
		insinto /etc/nginx
		doins "${HTTP_NAXSI_MODULE_WD}"/../naxsi_config/naxsi_core.rules
	fi

	if use rtmp; then
		docinto ${RTMP_MODULE_P}
		dodoc "${RTMP_MODULE_WD}"/{AUTHORS,README.md,TODO,stat.xsl}
	fi

	if use nginx_modules_http_fancyindex; then
		docinto ${HTTP_FANCYINDEX_MODULE_P}
		dodoc "${HTTP_FANCYINDEX_MODULE_WD}"/README.rst
	fi

	if use nginx_modules_http_lua; then
		docinto ${HTTP_LUA_MODULE_P}
		dodoc "${HTTP_LUA_MODULE_WD}"/{Changes,README.markdown}
	fi

	if use nginx_modules_http_auth_pam; then
		docinto ${HTTP_AUTH_PAM_MODULE_P}
		dodoc "${HTTP_AUTH_PAM_MODULE_WD}"/{README,ChangeLog}
	fi


	if use nginx_modules_http_metrics; then
		docinto ${HTTP_METRICS_MODULE_P}
		dodoc "${HTTP_METRICS_MODULE_WD}"/README.md
	fi

	if use nginx_modules_http_naxsi; then
		insinto /etc/nginx
		doins "${HTTP_NAXSI_MODULE_WD}"/../naxsi_config/naxsi_core.rules

		docinto ${HTTP_NAXSI_MODULE_P}
	fi

	if use rtmp; then
		docinto ${RTMP_MODULE_P}
		dodoc "${RTMP_MODULE_WD}"/{AUTHORS,README.md,TODO,stat.xsl}
	fi

	if use nginx_modules_http_dav_ext; then
		docinto ${HTTP_DAV_EXT_MODULE_P}
		dodoc "${HTTP_DAV_EXT_MODULE_WD}"/README
	fi
	if use nginx_modules_http_echo; then
		docinto ${HTTP_ECHO_MODULE_P}
		dodoc "${HTTP_ECHO_MODULE_WD}"/{README.markdown,doc/HttpEchoModule.wiki}
	fi

	if use nginx_modules_http_security; then
		docinto ${HTTP_SECURITY_MODULE_P}
		dodoc "${HTTP_SECURITY_MODULE_WD}"/{CHANGES,README.TXT,authors.txt}
	fi

	if use nginx_modules_http_push_stream; then
		docinto ${HTTP_PUSH_STREAM_MODULE_P}
		dodoc "${HTTP_PUSH_STREAM_MODULE_WD}"/{AUTHORS,CHANGELOG.textile,README.textile}
	fi
}

pkg_preinst() {
	if [ ! -d "${EROOT}"/etc/nginx/sites-available ]; then
		first_install=yes
	else
		first_install=no
	fi
}

pkg_postinst() {
	if [ "$first_install" = "yes" ] && [ ! -e "${EROOT}"/etc/nginx/sites-enabled/localhost ]; then
		einfo "Enabling example Web site (see http://127.0.0.1)"
		# enable example Web site (listens on localhost only)
		ln -s ../sites-available/localhost "${EROOT}"/etc/nginx/sites-enabled/localhost
	fi
	if use ssl; then
		if [ ! -f "${EROOT}"/etc/ssl/${PN}/${PN}.key ]; then
			install_cert /etc/ssl/${PN}/${PN}
			use prefix || chown ${PN}:${PN} "${EROOT}"/etc/ssl/${PN}/${PN}.{crt,csr,key,pem}
		fi
	fi

	if use nginx_modules_http_lua && use nginx_modules_http_spdy; then
		ewarn "Lua 3rd party module author warns against using ${P} with"
		ewarn "NGINX_MODULES_HTTP=\"lua spdy\". For more info, see http://git.io/OldLsg"
	fi

	# This is the proper fix for bug #458726/#469094 (bgo), resp. CVE-2013-0337 for
	# existing installations
	local fix_perms=0

	for rv in ${REPLACING_VERSIONS} ; do
		version_compare ${rv} 1.5.11
		[[ $? -eq 1 ]] && fix_perms=1
	done

	if [[ $fix_perms -eq 1 ]] ; then
		ewarn "To fix a security bug \(CVE-2013-0337, bug #458726\) had the following"
		ewarn "directories the world-readable bit removed \(if set\):"
		ewarn "  ${EPREFIX}/var/log/nginx/"
		ewarn "  ${EPREFIX}${NGINX_HOME_TMP}/{,client,proxy,fastcgi,scgi,uwsgi}"
		ewarn "Check if this is correct for your setup before restarting nginx!"
		ewarn "This is a one-time change and will not happen on subsequent updates."
		ewarn "Furthermore nginx' temp directories got moved to ${NGINX_HOME_TMP}"
		chmod o-rwx "${EPREFIX}"/var/log/nginx "${EPREFIX}/${NGINX_HOME_TMP}"/{,client,proxy,fastcgi,scgi,uwsgi}
	fi

	einfo "If nginx complains about insufficient number of open files at start, ensure"
	einfo "that you have a current /etc/security/limits.conf and logout and log back in"
	einfo "to your system to ensure that the new max open file limits are active. Then"
	einfo "try restarting nginx again."

	# If the nginx user can't change into or read the dir, display a warning.
	# If su is not available we display the warning nevertheless since we can't check properly
	su -s /bin/sh -c 'cd /var/log/nginx/ && ls' nginx >&/dev/null
	if [ $? -ne 0 ] ; then
		ewarn "Please make sure that the nginx user or group has at least"
		ewarn "'rx' permissions on /var/log/nginx (default on a fresh install)"
		ewarn "Otherwise you end up with empty log files after a logrotate."
	fi
}
