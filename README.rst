==========================
The Phoenix Meta-Gentoo Overlay
==========================

:keywords: webauth, sso, funtoo, gentoo, ebuild, perl, dancer, monitoring
:description:

    The beginnings of a meta distribution

:author: Daniel Molik
:contact: dan@d3fy.net
:website: http://d3fy.net
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
        3) Dancer-Session-(Redis|Memcache)

Ebuild List
===========

    * app-admin/clockwork
    * app-admin/puppet
    * app-admin/rsyslog
    * dev-libs/ctap
    * dev-libs/remctl
    * dev-perl/Apache-LogFormat-Compiler
    * dev-perl/App-Rad
    * dev-perl/App-Rad-Plugin-MoreHelp
    * dev-perl/CGI-Application
    * dev-perl/CGI-Application-Plugin-AutoRunmode
    * dev-perl/CGI-Application-Plugin-Forward
    * dev-perl/CGI-Application-Plugin-Redirect
    * dev-perl/CGI-Application-Plugin-TT
    * dev-perl/CSS-Minifier-XS
    * dev-perl/Carp-Clan-Share
    * dev-perl/Crypt-OpenSSL-CA
    * dev-perl/Crypt-URandom
    * dev-perl/DBIx-Class-IntrospectableM2M
    * dev-perl/DBIx-Class-Schema-Loader
    * dev-perl/Dancer
    * dev-perl/Dancer-Logger-Log4perl
    * dev-perl/Dancer-Plugin-Assets
    * dev-perl/Dancer-Plugin-DBIC
    * dev-perl/Dancer-Plugin-Database
    * dev-perl/Dancer-Plugin-REST
    * dev-perl/Dancer-Session-Cookie
    * dev-perl/Devel-Cover
    * dev-perl/Devel-Leak
    * dev-perl/Devel-Mallinfo
    * dev-perl/Directory-Scratch
    * dev-perl/ExtUtils-Config
    * dev-perl/ExtUtils-Helpers
    * dev-perl/ExtUtils-InstallPaths
    * dev-perl/ExtUtils-ModuleMaker
    * dev-perl/File-Assets
    * dev-perl/File-Save-Home
    * dev-perl/File-ShareDir-Install
    * dev-perl/Git-Repository
    * dev-perl/HTML-Declare
    * dev-perl/HTML-Selector-XPath
    * dev-perl/HTML-TreeBuilder-XPath
    * dev-perl/HTTP-Parser-XS
    * dev-perl/HTTP-Server-Simple-PSGI
    * dev-perl/IO-CaptureOutput
    * dev-perl/JavaScript-Minifier-XS
    * dev-perl/Lingua-EN-FindNumber
    * dev-perl/Lingua-EN-Inflect-Number
    * dev-perl/Lingua-EN-Inflect-Phrase
    * dev-perl/Lingua-EN-Number-IsOrdinal
    * dev-perl/Lingua-EN-Tagger
    * dev-perl/Lingua-EN-Words2Nums
    * dev-perl/Math-FFT
    * dev-perl/Math-MatrixReal
    * dev-perl/Math-MatrixSparse
    * dev-perl/Memoize-ExpireLRU
    * dev-perl/Module-Build-Tiny
    * dev-perl/NanoMsg-Raw
    * dev-perl/Net-OpenStack-Compute
    * dev-perl/Number-Tolerant
    * dev-perl/Object-Tiny
    * dev-perl/Path-Abstract
    * dev-perl/Path-Resource
    * dev-perl/Plack
    * dev-perl/Sereal-Decoder
    * dev-perl/Sereal-Encoder
    * dev-perl/Session-Storage-Secure
    * dev-perl/Starman
    * dev-perl/String-CamelCase
    * dev-perl/String-Compare-ConstantTime
    * dev-perl/String-PerlIdentifier
    * dev-perl/String-ToIdentifier-EN
    * dev-perl/System-Command
    * dev-perl/Test-Cmd
    * dev-perl/Test-Cucumber-Tiny
    * dev-perl/Test-Group
    * dev-perl/Test-Lazy
    * dev-perl/Twiggy
    * dev-perl/WWW-Mechanize-Pluggable
    * dev-perl/WWW-Mechanize-Plugin-Web-Scraper
    * dev-perl/WWW-YouTube-Download
    * dev-perl/Web-Scraper
    * dev-perl/XML-Tiny
    * dev-ruby/kgio
    * dev-ruby/raindrops
    * dev-ruby/rspec
    * dev-ruby/tidy_ffi
    * dev-ruby/wrongdoc
    * dev-vcs/watchman
    * net-analyzer/nagmq
    * net-analyzer/nsca-ng
    * net-analyzer/rrdtool
    * sys-apps/hwids
    * sys-cluster/drbd
    * sys-cluster/drbd-kernel
    * sys-cluster/ganglia
    * sys-cluster/hadoop
    * sys-cluster/zookeeper
    * sys-fs/lvm2
    * virtual/d3fy-auth
    * virtual/udev
    * www-apache/mod_webauth
    * www-client/phantomjs
    * www-misc/fcgiwrap
    * www-servers/jetty
    * www-servers/lighttpd
    * www-servers/thin
    * www-servers/unicorn
    * x11-drivers/ati-drivers
