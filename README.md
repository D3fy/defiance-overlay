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

  - [app-admin](https://packages.gentoo.org/categories/app-admin)
    - [clockwork](http://clockwork.niftylogic.com/) -  [3.3.2](/app-admin/clockwork/clockwork-3.3.2.ebuild) -
      The nifty configuration managment system
    - [heketi](https://github.com/heketi/heketi) -  [8.0.0](/app-admin/heketi/heketi-8.0.0.ebuild) [9.0.0](/app-admin/heketi/heketi-9.0.0.ebuild) -
      RESTful based volume management framework for GlusterFS
  - [app-emulation](https://packages.gentoo.org/categories/app-emulation)
    - [cri-o](http://cri-o.io/) -  [1.14.0](/app-emulation/cri-o/cri-o-1.14.0.ebuild) -
      Lightweight container runtime for Kubernetes
    - [crun](https://github.com/containers/crun) -  [0.14.1](/app-emulation/crun/crun-0.14.1.ebuild) -
      A fast and low-memory footprint OCI Container Runtime fully written in C
    - [kvmtool](https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/) -  [9999](/app-emulation/kvmtool/kvmtool-9999.ebuild) -
      A lightweight tool for hosting KVM guests
    - [runv](https://github.com/hyperhq/runv) -  [1.0.0](/app-emulation/runv/runv-1.0.0.ebuild) -
      Hypervisor-based Runtime for OCI
  - [dev-db](https://packages.gentoo.org/categories/dev-db)
    - [citus](https://www.citusdata.com/) -  [9.5.0](/dev-db/citus/citus-9.5.0.ebuild) -
      Scalable PostgreSQL for multi-tenant and real-time workloads
    - [cstore_fdw](https://www.citusdata.com/) -  [1.7.0](/dev-db/cstore_fdw/cstore_fdw-1.7.0.ebuild) -
      Columnar store for analytics with Postgres
    - [git_fdw](https://github.com/franckverrot/git_fdw) -  [9999](/dev-db/git_fdw/git_fdw-9999.ebuild) -
      A PostgreSQL foreign data wrapper for git
    - [hypopg](http://hypopg.github.io/hypopg/) -  [1.1.4](/dev-db/hypopg/hypopg-1.1.4.ebuild) -
      Hypothetical Indexes for PostgreSQL
    - [kafka_fdw](https://github.com/adjust/kafka_fdw) -  [9999](/dev-db/kafka_fdw/kafka_fdw-9999.ebuild) -
      kafka foreign database wrapper for postresql
    - [pg_jobmon](https://github.com/omniti-labs/pg_jobmon) -  [1.3.3](/dev-db/pg_jobmon/pg_jobmon-1.3.3.ebuild) -
      PostgreSQL Extension for logging and monitoring automated jobs
    - [pg_partman](https://github.com/keithf4/pg_partman) -  [3.1.1](/dev-db/pg_partman/pg_partman-3.1.1.ebuild) -
      Postgres time and serial partitioner
    - [pg_pathman](https://github.com/postgrespro/pg_pathman) -  [1.4.9](/dev-db/pg_pathman/pg_pathman-1.4.9.ebuild) -
      Partitioning tool for PostgreSQL
    - [pg_qualstats](https://github.com/powa-team/pg_qualstats) -  [2.0.2](/dev-db/pg_qualstats/pg_qualstats-2.0.2.ebuild) -
      A Postgres extension for collecting statistics about predicate
    - [pg_stat_kcache](https://github.com/powa-team/pg_stat_kcache) -  [2.1.3](/dev-db/pg_stat_kcache/pg_stat_kcache-2.1.3.ebuild) -
      Gather statistics about disk access and CPU consumption done by backends
    - [postgresql-hll](https://github.com/citusdata/postgresql-hll) -  [2.15](/dev-db/postgresql-hll/postgresql-hll-2.15.ebuild) -
      PostgreSQL extension adding HyperLogLog data structures as a native data type
    - [powa](http://powa-team.github.io/powa/) -  [4.0.1](/dev-db/powa/powa-4.0.1.ebuild) -
      PostgreSQL Workload Analyzer
    - [powa-web](http://powa.readthedocs.io/en/latest/powa-web/index.html) -  [4.0.2](/dev-db/powa-web/powa-web-4.0.2.ebuild) -
      The PostgreSQL Workload Analyzer web frontend
    - [redis_fdw](https://github.com/pg-redis-fdw/redis_fdw) -  [9999](/dev-db/redis_fdw/redis_fdw-9999.ebuild) -
      A PostgreSQL foreign data wrapper for Redis
    - [timescaledb](http://www.timescale.com/) -  [1.7.2](/dev-db/timescaledb/timescaledb-1.7.2.ebuild) [1.7.4](/dev-db/timescaledb/timescaledb-1.7.4.ebuild) -
      A time-series database optimized for fast ingest and complex queries
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
    - [packer](https://www.packer.io) -  [1.6.5](/dev-util/packer/packer-1.6.5.ebuild) -
      A tool to create identical machine images for multiple platforms
  - [media-libs](https://packages.gentoo.org/categories/media-libs)
    - [gmmlib](https://github.com/intel/gmmlib) -  [20.1.1](/media-libs/gmmlib/gmmlib-20.1.1.ebuild) [9999](/media-libs/gmmlib/gmmlib-9999.ebuild) -
      Intel Graphics Memory Management Library
  - [media-plugins](https://packages.gentoo.org/categories/media-plugins)
    - [gst-plugins-vaapi](https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi) -  [1.16.2](/media-plugins/gst-plugins-vaapi/gst-plugins-vaapi-1.16.2.ebuild) -
      Hardware accelerated video decoding through VA-API plugin for GStreamer
  - [net-dns](https://packages.gentoo.org/categories/net-dns)
    - [bind-dyndb-ldap](https://fedorahosted.org/bind-dyndb-ldap/) -  [11.1](/net-dns/bind-dyndb-ldap/bind-dyndb-ldap-11.1.ebuild) [9999](/net-dns/bind-dyndb-ldap/bind-dyndb-ldap-9999.ebuild) -
      Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)
  - [net-libs](https://packages.gentoo.org/categories/net-libs)
    - [dpdk](http://dpdk.org/) -  [17.11.3](/net-libs/dpdk/dpdk-17.11.3.ebuild) [18.05](/net-libs/dpdk/dpdk-18.05.ebuild) -
      A set of libraries and drivers for fast packet processing
    - [libcurve](http://curvezmq.org) -  [9999](/net-libs/libcurve/libcurve-9999.ebuild) -
      An encryption and authentication library for ZeroMQ applications
    - [rtrlib](http://rtrlib.realmv6.org/) -  [0.6.3](/net-libs/rtrlib/rtrlib-0.6.3.ebuild) -
      An open-source C implementation of the RPKI/Router Protocol client
  - [net-misc](https://packages.gentoo.org/categories/net-misc)
    - [bird](http://bird.network.cz) -  [2.0.1](/net-misc/bird/bird-2.0.1.ebuild) -
      A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 or IPv6
    - [cni-plugins](https://github.com/containernetworking/plugins) -  [0.7.2](/net-misc/cni-plugins/cni-plugins-0.7.2.ebuild) -
      Some standard networking plugins, maintained by the CNI team
    - [frr](https://frrouting.org/) -  [6.0](/net-misc/frr/frr-6.0.ebuild) -
      an IP routing protocol suite for BGP, IS-IS, LDP, OSPF, PIM, and RIP
    - [openvswitch](http://openvswitch.org) -  [2.9.2](/net-misc/openvswitch/openvswitch-2.9.2.ebuild) -
      Production quality, multilayer virtual switch
  - [net-nds](https://packages.gentoo.org/categories/net-nds)
    - [openldap](http://www.OpenLDAP.org/) -  [r1](/net-nds/openldap/openldap-r1.ebuild) [2.4.47](/net-nds/openldap/openldap-2.4.47.ebuild) -
      LDAP suite of application and development tools
  - [net-proxy](https://packages.gentoo.org/categories/net-proxy)
    - [seesaw](https://github.com/google/seesaw) -  [9999](/net-proxy/seesaw/seesaw-9999.ebuild) -
      Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform
  - [net-vpn](https://packages.gentoo.org/categories/net-vpn)
    - [networkmanager-strongswan](https://www.strongswan.org/) -  [1.5.0](/net-vpn/networkmanager-strongswan/networkmanager-strongswan-1.5.0.ebuild) -
      NetworkManager StrongSwan plugin
    - [strongswan](https://www.strongswan.org/) -  [5.8.4](/net-vpn/strongswan/strongswan-5.8.4.ebuild) -
      IPsec-based VPN solution, supporting IKEv1/IKEv2 and MOBIKE
  - [sys-cluster](https://packages.gentoo.org/categories/sys-cluster)
    - [nomad](http://www.nomadproject.io) -  [0.8.0](/sys-cluster/nomad/nomad-0.8.0.ebuild) -
      The cluster manager from Hashicorp
  - [www-apps](https://packages.gentoo.org/categories/www-apps)
    - [gitea](https://gitea.io/en-us/) -  [1.7.0](/www-apps/gitea/gitea-1.7.0.ebuild) -
      A painless self-hosted Git service, written in Go
  - [www-servers](https://packages.gentoo.org/categories/www-servers)
    - [nginx](https://nginx.org) -  [1.14.1](/www-servers/nginx/nginx-1.14.1.ebuild) [1.15.9](/www-servers/nginx/nginx-1.15.9.ebuild) [1.17.0](/www-servers/nginx/nginx-1.17.0.ebuild) [1.17.1](/www-servers/nginx/nginx-1.17.1.ebuild) -
      Robust, small and high performance http and reverse proxy server
  - [x11-libs](https://packages.gentoo.org/categories/x11-libs)
    - [libva](https://01.org/linuxmedia/vaapi) -  [2.7.0](/x11-libs/libva/libva-2.7.0.ebuild) [9999](/x11-libs/libva/libva-9999.ebuild) -
      Video Acceleration (VA) API for Linux
    - [libva-intel-media-driver](https://github.com/intel/media-driver) -  [20.1.1](/x11-libs/libva-intel-media-driver/libva-intel-media-driver-20.1.1.ebuild) [9999](/x11-libs/libva-intel-media-driver/libva-intel-media-driver-9999.ebuild) -
      Intel Media Driver for VAAPI (iHD)
  - [x11-themes](https://packages.gentoo.org/categories/x11-themes)
    - [albatross](http://shimmerproject.org/projects/albatross/) -  [1.7.4](/x11-themes/albatross/albatross-1.7.4.ebuild) -
      Desktop Suite for Xfce
