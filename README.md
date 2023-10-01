# The Defiance Overlay

[![Waffle.io - Columns and their card count](https://badge.waffle.io/D3fy/defiance-overlay.svg?columns=To%20do,In%20Progress&style=flat-square)](https://waffle.io/D3fy/defiance-overlay)
[![Shield.io - Flat travis icon](https://img.shields.io/travis/D3fy/defiance-overlay.svg?style=flat-square)](https://travis-ci.org/D3fy/defiance-overlay)

Ebuilds of the future! No really I'm not really sure why I put so much work into maintaining all of these. But they are here for anyone to use and enjoy. Please report any breakage imediatly using Github issues.


## Installation

For Layman

	layman -a defiance

For Portage >= 2.3.8:

	cd /usr/local && git clone https://github.com/d3fy/defiance-overlay.git
	echo -e "[defiance]\nlocation = /usr/local/defiance-overlay\nsync-type = git\nsync-uri  = https://github.com/d3fy/defiance-overlay.git\nauto-sync = true" >> /etc/portage/repos.conf/defiance.conf

## List of Ebuilds

  - [app-emulation](https://packages.gentoo.org/categories/app-emulation)
    - [kvmtool](https://github.com/kvmtool/kvmtool) -  [9999](/app-emulation/kvmtool/kvmtool-9999.ebuild) -
      A lightweight tool for hosting KVM guests
  - [dev-db](https://packages.gentoo.org/categories/dev-db)
    - [cstore_fdw](https://www.citusdata.com/) -  [1.7.0](/dev-db/cstore_fdw/cstore_fdw-1.7.0.ebuild) -
      Columnar store for analytics with Postgres
    - [git_fdw](https://github.com/franckverrot/git_fdw) -  [9999](/dev-db/git_fdw/git_fdw-9999.ebuild) -
      A PostgreSQL foreign data wrapper for git
    - [hypopg](http://hypopg.github.io/hypopg/) -  [1.4.0](/dev-db/hypopg/hypopg-1.4.0.ebuild) -
      Hypothetical Indexes for PostgreSQL
    - [kafka_fdw](https://github.com/adjust/kafka_fdw) -  [9999](/dev-db/kafka_fdw/kafka_fdw-9999.ebuild) -
      kafka foreign database wrapper for postresql
    - [pg_partman](https://github.com/keithf4/pg_partman) -  [4.7.2](/dev-db/pg_partman/pg_partman-4.7.2.ebuild) -
      Postgres time and serial partitioner
    - [pg_partman](https://github.com/keithf4/pg_partman) -  -
      Postgres time and serial partitioner
    - [pg_qualstats](https://github.com/powa-team/pg_qualstats) -  [2.1.0](/dev-db/pg_qualstats/pg_qualstats-2.1.0.ebuild) -
      A Postgres extension for collecting statistics about predicate
    - [pg_stat_kcache](https://github.com/powa-team/pg_stat_kcache) -  [2.2.1](/dev-db/pg_stat_kcache/pg_stat_kcache-2.2.1.ebuild) [9999](/dev-db/pg_stat_kcache/pg_stat_kcache-9999.ebuild) -
      Gather statistics about disk access and CPU consumption done by backends
    - [pgaudit](http://pgaudit.org/) -  [16.0](/dev-db/pgaudit/pgaudit-16.0.ebuild) -
      Open Source PostgreSQL Audit Logging
    - [pgvector](https://github.com/pgvector/pgvector) -  [0.5.0](/dev-db/pgvector/pgvector-0.5.0.ebuild) -
      Open-source vector similarity search for Postgres 
    - [postgresql-hll](https://github.com/citusdata/postgresql-hll) -  [2.17](/dev-db/postgresql-hll/postgresql-hll-2.17.ebuild) -
      PostgreSQL extension adding HyperLogLog data structures as a native data type
    - [powa](http://powa-team.github.io/powa/) -  [4.2.0](/dev-db/powa/powa-4.2.0.ebuild) -
      PostgreSQL Workload Analyzer
    - [powa-collector](https://powa.readthedocs.io/) -  [1.2.0](/dev-db/powa-collector/powa-collector-1.2.0.ebuild) -
      A multi-threaded program that performs the snapshots for the remote servers configured in a powa repository.
    - [powa-web](http://powa.readthedocs.io/en/latest/powa-web/index.html) -  [4.2.0](/dev-db/powa-web/powa-web-4.2.0.ebuild) -
      The PostgreSQL Workload Analyzer web frontend
    - [redis_fdw](https://github.com/pg-redis-fdw/redis_fdw) -  [9999](/dev-db/redis_fdw/redis_fdw-9999.ebuild) -
      A PostgreSQL foreign data wrapper for Redis
  - [dev-libs](https://packages.gentoo.org/categories/dev-libs)
    - [ctap](https://github.com/jhunt/ctap/) -  [2.0.0](/dev-libs/ctap/ctap-2.0.0.ebuild) -
      Test Anything Protocol (tap) for C
    - [intel-ipsec-mb](https://github.com/intel/intel-ipsec-mb) -  [0.49](/dev-libs/intel-ipsec-mb/intel-ipsec-mb-0.49.ebuild) -
      Multi-Buffer Crypto for IPsec Library
    - [libmill](http://libmill.org/) -  [1.18](/dev-libs/libmill/libmill-1.18.ebuild) -
      Go-style concurrency for C
    - [libspooky](https://github.com/graytshirt/libspooky) -  [1.0.0](/dev-libs/libspooky/libspooky-1.0.0.ebuild) -
      Spooky hash lib
  - [dev-util](https://packages.gentoo.org/categories/dev-util)
    - [ostree](https://ostree.readthedocs.io/en/latest/) -  [2019.1](/dev-util/ostree/ostree-2019.1.ebuild) [2019.2](/dev-util/ostree/ostree-2019.2.ebuild) -
      Operating system and container binary deployment and upgrades
    - [packer](https://www.packer.io) -  [1.7.0](/dev-util/packer/packer-1.7.0.ebuild) -
      A tool to create identical machine images for multiple platforms
  - [media-plugins](https://packages.gentoo.org/categories/media-plugins)
    - [gst-plugins-vaapi](https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi) -  [1.16.2](/media-plugins/gst-plugins-vaapi/gst-plugins-vaapi-1.16.2.ebuild) -
      Hardware accelerated video decoding through VA-API plugin for GStreamer
  - [net-dns](https://packages.gentoo.org/categories/net-dns)
    - [bind-dyndb-ldap](https://pagure.io/bind-dyndb-ldap) -  [11.10](/net-dns/bind-dyndb-ldap/bind-dyndb-ldap-11.10.ebuild) [9999](/net-dns/bind-dyndb-ldap/bind-dyndb-ldap-9999.ebuild) -
      Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)
  - [net-libs](https://packages.gentoo.org/categories/net-libs)
    - [libcurve](http://curvezmq.org) -  [9999](/net-libs/libcurve/libcurve-9999.ebuild) -
      An encryption and authentication library for ZeroMQ applications
  - [x11-themes](https://packages.gentoo.org/categories/x11-themes)
    - [albatross](http://shimmerproject.org/projects/albatross/) -  [1.7.4](/x11-themes/albatross/albatross-1.7.4.ebuild) -
      Desktop Suite for Xfce
