# The Defiance Overlay

[![Waffle.io - Columns and their card count](https://badge.waffle.io/D3fy/defiance-overlay.svg?columns=To%20do,In%20Progress&style=flat-square)](https://waffle.io/D3fy/defiance-overlay)

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

  - [albatross](http://shimmerproject.org/projects/albatross/)
    Desktop Suite for Xfce
  - [bind-dyndb-ldap](https://fedorahosted.org/bind-dyndb-ldap/)
    Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)
  - [bolo](https://github.com/bolo/bolo-collectors)
    Collector Scripts for bolo
  - [bolo-collectors](https://github.com/bolo/bolo-collectors)
    Collector Scripts for bolo
  - [citus](https://www.citusdata.com/)
    Scalable PostgreSQL for multi-tenant and real-time workloads
  - [clockwork](http://clockwork.niftylogic.com/)
    The nifty configuration managment system
  - [cni-plugins](https://github.com/containernetworking/plugins)
    Some standard networking plugins, maintained by the CNI team
  - [cri-o](http://cri-o.io/)
    Lightweight container runtime for Kubernetes
  - [ctap](https://github.com/jhunt/ctap/)
    Test Anything Protocol (tap) for C
  - [dpdk](http://dpdk.org/)
    A set of libraries and drivers for fast packet processing
  - [frr](https://frrouting.org/)
    an IP routing protocol suite for BGP, IS-IS, LDP, OSPF, PIM, and RIP
  - [glusterfs](http://www.gluster.org/)
    GlusterFS is a powerful network/cluster filesystem
  - [heketi](https://github.com/heketi/heketi)
    RESTful based volume management framework for GlusterFS
  - [hypopg](http://dalibo.github.io/hypopg/)
    Hypothetical Indexes for PostgreSQL
  - [intel-ipsec-mb](https://github.com/intel/intel-ipsec-mb)
    Multi-Buffer Crypto for IPsec Library
  - [libcurve](http://curvezmq.org)
    An encryption and authentication library for ZeroMQ applications
  - [libmill](http://libmill.org/)
    Go-style concurrency for C
  - [libspooky](https://github.com/graytshirt/libspooky)
    Spooky hash lib
  - [libvigor](https://github.com/jhunt/libvigor)
    The missing bits of C
  - [nomad](http://www.nomadproject.io)
    The cluster manager from Hashicorp
  - [openvswitch](http://openvswitch.org)
    Production quality, multilayer virtual switch
  - [ostree](https://ostree.readthedocs.io/en/latest/)
    Operating system and container binary deployment and upgrades
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
  - [ragel](http://www.colm.net/open-source/ragel/)
    Compiles finite state machines from regular languages into executable code
  - [seesaw](https://github.com/google/seesaw)
    Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform
  - [timescaledb](http://www.timescale.com/)
    A time-series database optimized for fast ingest and complex queries
  - [ztk](https://github.com/jhunt/ztk)
    ZeroMQ Toolkit
