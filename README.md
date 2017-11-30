# The Defiance Overlay

The beginnings of a meta distribution

Here are some SEO keywords:

Gentoo, ebuild
Orchestration: kubernetes, kubectl, kubelet
Load balancing: [seesaw](https://github.com/google/seesaw), google seesaw
Monitoring: [bolo](https://github.com/bolo)
Configuration Management: clockwork
libs: libmill, libconcurrent, libspooky, libvigor



## Installation

For Layman

	layman -a defiance

For Portage >= 2.3.8:

	cd /usr/local && git clone https://github.com/d3fy/defiance-overlay.git
	echo -e "[defiance]\nlocation = /usr/local/defiance-overlay\nsync-type = git\nsync-uri  = https://github.com/d3fy/defiance-overlay.git\nauto-sync = true" >> /etc/portage/repos.conf/defiance.conf

## List of Ebuilds

  - [clockwork](http://clockwork.niftylogic.com/)
    The nifty configuration managment system
  - [helm-bin](https://helm.sh/)
    The Kubernetes Package Manager
  - [ztk](https://github.com/jhunt/ztk)
    ZeroMQ Toolkit
  - [citus](https://www.citusdata.com/)
    Scalable PostgreSQL for multi-tenant and real-time workloads
  - [hypopg](http://dalibo.github.io/hypopg/)
    Hypothetical Indexes for PostgreSQL
  - [pg_qualstats](https://github.com/dalibo/pg_qualstats)
    A PostgreSQL extension for collecting statistics about predicates, helping find what indices are missing
  - [pg_stat_kcache](https://github.com/dalibo/pg_stat_kcache)
    Gather statistics about physical disk access and CPU consumption done by backends
  - [postgresql-hll](https://github.com/citusdata/postgresql-hll)
    PostgreSQL extension adding HyperLogLog data structures as a native data type
  - [powa](http://dalibo.github.io/powa/)
    PostgreSQL Workload Analyzer
  - [powa-web](http://powa.readthedocs.io/en/latest/powa-web/index.html)
    The PostgreSQL Workload Analyzer web frontend
  - [timescaledb](http://www.timescale.com/)
    A time-series database optimized for fast ingest and complex queries
  - [ctap](https://github.com/jhunt/ctap/)
    Test Anything Protocol (tap) for C
  - [intel-ipsec-mb](https://github.com/intel/intel-ipsec-mb)
    Multi-Buffer Crypto for IPsec Library
  - [libmill](http://libmill.org/)
    Go-style concurrency for C
  - [libspooky](https://github.com/graytshirt/libspooky)
    Spooky hash lib
  - [libvigor](https://github.com/jhunt/libvigor)
    The missing bits of C
  - [ostree](https://ostree.readthedocs.io/en/latest/)
    Operating system and container binary deployment and upgrades
  - [ragel](http://www.colm.net/open-source/ragel/)
    Compiles finite state machines from regular languages into executable code
  - [bolo](https://github.com/bolo/bolo-collectors)
    Collector Scripts for bolo
  - [bolo-collectors](https://github.com/bolo/bolo-collectors)
    Collector Scripts for bolo
  - [bind-dyndb-ldap](https://fedorahosted.org/bind-dyndb-ldap/)
    Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)
  - [dpdk](http://dpdk.org/)
    A set of libraries and drivers for fast packet processing
  - [libcurve](http://curvezmq.org)
    An encryption and authentication library for ZeroMQ applications
  - [frr](https://frrouting.org/)
    an IP routing protocol suite for BGP, IS-IS, LDP, OSPF, PIM, and RIP
  - [seesaw](https://github.com/google/seesaw)
    Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform
  - [glusterfs](http://www.gluster.org/)
    GlusterFS is a powerful network/cluster filesystem
  - [nomad](http://www.nomadproject.io)
    The cluster manager from Hashicorp
  - [albatross](http://shimmerproject.org/projects/albatross/)
    Desktop Suite for Xfce
