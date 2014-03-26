==========================
The Phoenix Meta-Gentoo Overlay
==========================

:keywords: webauth, sso, funtoo, gentoo, ebuild, perl, dancer
:description:

    The beginnings of a meta distribution

:author: Daniel Molik
:contact: dan@runedrive.com
:copyright: GPL-2
:language: English

Introduction
============

    This overlay is the result of my internet wanderings and work experiance over the
    last few years. I hope that other people can benifit from whatever I have learned.
    It has morphed from a youthful and naive big-data dream into a c10k and sso overlay.

    Additionally, this repo is the beginnings of the Defiance Linux (d3fynix) distribution.
    Which will be opionated, but effort will be made to keep it clean and fast.

Installation
============

    ::

        cd /usr/local && git clone https://github.com/GrayTShirt/phoenix-overlay.git
        echo "PORTDIR_OVERLAY=\"/usr/local/phoenix-overlay\"" >> /etc/make.conf
        echo -e "@egencache --repo=Phoenix --update
        !cd /usr/local/phoenix-overlay && git pull && git gc" > /etc/eix-sync.conf

TODO
====

    The current todo list includes:
        1) Dancer-Auth-Krb5-Simple
        2) Dancer-Auth-Krb5(-complete)? I or someone else has to write this
        3) Dancer-Plugin-Memcache
        4) Dancer2 & Dancer2 plugins, namely cache and queue
        5) Dancer-Session-(Redis|Memcache)

Ebuild List
===========

* app-admin/puppet
* app-admin/rsyslog
* app-admin/clockwork
* dev-perl/CGI-Application-Plugin-AutoRunmode
* dev-perl/CGI-Application-Plugin-Forward
* dev-perl/CGI-Application-Plugin-Redirect
* dev-perl/CGI-Application-Plugin-TT
* dev-perl/CGI-Application
* dev-perl/Git-Repository
* dev-perl/HTML-Selector-XPath
* dev-perl/HTML-TreeBuilder-XPath
* dev-perl/System-Command
* dev-perl/WWW-Mechanize-Pluggable
* dev-perl/WWW-Mechanize-Plugin-Web-Scraper
* dev-perl/WWW-YouTube-Download
* dev-perl/Web-Scraper
* dev-perl/Math-MatrixSparse
* dev-perl/Math-MatrixReal
* dev-perl/App-Rad
* dev-perl/App-Rad-Plugin-MoreHelp
* dev-perl/Net-OpenStack-Compute
* dev-perl/IO-CaptureOutput
* dev-perl/Devel-Cover
* dev-perl/Math-FFT
* dev-perl/Dancer
* dev-perl/HTTP-Server-Simple-PSGI
* dev-perl/Plack
* dev-perl/File-ShareDir-Install
* dev-perl/Dancer-Plugin-Database
* dev-perl/ExtUtils-ModuleMaker
* dev-perl/File-Save-Home
* dev-perl/String-PerlIdentifier
* dev-perl/ExtUtils-Config
* dev-perl/ExtUtils-Helpers
* dev-perl/ExtUtils-InstallPaths
* dev-perl/HTTP-Parser-XS
* dev-perl/Module-Build-Tiny
* dev-perl/Starman
* dev-perl/Twiggy
* dev-perl/Dancer-Plugin-DBIC
* dev-perl/Apache-LogFormat-Compiler
* dev-perl/Dancer-Logger-Log4perl
* dev-perl/DBIx-Class-IntrospectableM2M
* dev-perl/DBIx-Class-Schema-Loader
* dev-perl/Lingua-EN-FindNumber
* dev-perl/Lingua-EN-Inflect-Number
* dev-perl/Lingua-EN-Inflect-Phrase
* dev-perl/Lingua-EN-Number-IsOrdinal
* dev-perl/Lingua-EN-Tagger
* dev-perl/Lingua-EN-Words2Nums
* dev-perl/Memoize-ExpireLRU
* dev-perl/String-CamelCase
* dev-perl/String-ToIdentifier-EN
* dev-perl/NanoMsg-Raw
* dev-perl/Dancer-Plugin-REST
* dev-perl/Crypt-URandom
* dev-perl/Number-Tolerant
* dev-perl/Sereal-Decoder
* dev-perl/Sereal-Encoder
* dev-perl/String-Compare-ConstantTime
* dev-perl/Session-Storage-Secure
* dev-perl/Dancer-Session-Cookie
* sys-cluster/drbd-kernel
* sys-cluster/drbd
* sys-cluster/ganglia
* sys-cluster/hadoop
* sys-cluster/zookeeper
* www-apache/mod_webauth
* www-misc/fcgiwrap
* www-servers/thin
* www-servers/unicorn
* www-servers/jetty
* www-servers/lighttpd
* dev-ruby/kgio
* dev-ruby/raindrops
* dev-ruby/tidy_ffi
* dev-ruby/wrongdoc
* dev-ruby/rspec
* sys-kernel/linux-headers
* www-client/phantomjs
* virtual/d3fy-auth
* virtual/udev
* eclass/perl-mb-tiny.eclass
* sys-apps/hwids
* sys-fs/lvm2
* x11-drivers/ati-drivers
* dev-vcs/watchman
* net-analyzer/nsca-ng
* net-analyzer/rrdtool
* dev-libs/ctap
* dev-libs/remctl
