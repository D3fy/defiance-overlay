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

  - app-admin
    - [clockwork](http://clockwork.niftylogic.com/) 3.3.2
      The nifty configuration managment system
    - [heketi](https://github.com/heketi/heketi) 5.0.1
      RESTful based volume management framework for GlusterFS
    - [terraform](https://www.terraform.io/) 0.11.7
      Terraform is a tool for building, changing, and combining infrastructure safely and efficiently.
  - app-emulation
    - [cri-o](http://cri-o.io/) 1.10.4
      Lightweight container runtime for Kubernetes
    - [kvmtool](https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/) 9999
      A lightweight tool for hosting KVM guests
    - [runv](https://github.com/hyperhq/runv) 1.0.0
      Hypervisor-based Runtime for OCI
  - dev-db
    - [citus](https://www.citusdata.com/) 7.4.1
      Scalable PostgreSQL for multi-tenant and real-time workloads
    - [hypopg](http://hypopg.github.io/hypopg/) 1.1.2
      Hypothetical Indexes for PostgreSQL
    - [pg_jobmon](https://github.com/omniti-labs/pg_jobmon) 1.3.3
      PostgreSQL Extension for logging and monitoring automated jobs
    - [pg_partman](https://github.com/keithf4/pg_partman) 3.1.1
      Postgres time and serial partitioner
    - [pg_pathman](https://github.com/postgrespro/pg_pathman) 1.4.9
      Partitioning tool for PostgreSQL
    - [pg_qualstats](https://github.com/powa-team/pg_qualstats) 1.0.4
      A Postgres extension for collecting statistics about predicate
    - [pg_stat_kcache](https://github.com/powa-team/pg_stat_kcache) 2.0.3
      Gather statistics about disk access and CPU consumption done by backends
    - [postgresql-hll](https://github.com/citusdata/postgresql-hll) 2.10.2
      PostgreSQL extension adding HyperLogLog data structures as a native data type
    - [powa](http://powa-team.github.io/powa/) 3.1.1
      PostgreSQL Workload Analyzer
    - [powa-web](http://powa.readthedocs.io/en/latest/powa-web/index.html) 3.1.4
      The PostgreSQL Workload Analyzer web frontend
    - [timescaledb](http://www.timescale.com/) 0.10.0 9999
      A time-series database optimized for fast ingest and complex queries
  - dev-libs
    - [ctap](https://github.com/jhunt/ctap/) 2.0.0
      Test Anything Protocol (tap) for C
    - [intel-ipsec-mb](https://github.com/intel/intel-ipsec-mb) 0.49
      Multi-Buffer Crypto for IPsec Library
    - [libmill](http://libmill.org/) 1.18
      Go-style concurrency for C
    - [libspooky](https://github.com/graytshirt/libspooky) 1.0.0
      Spooky hash lib
  - dev-util
    - [ostree](https://ostree.readthedocs.io/en/latest/) 2018.6
      Operating system and container binary deployment and upgrades
    - [packer](http://www.packer.io) 1.2.4
      Packer is a tool for creating identical machine images for multiple platforms
  - net-dns
    - [bind-dyndb-ldap](https://fedorahosted.org/bind-dyndb-ldap/) 11.1 9999
      Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)
  - net-libs
    - [dpdk](http://dpdk.org/) 17.11.3 18.05
      A set of libraries and drivers for fast packet processing
    - [libcurve](http://curvezmq.org) 9999
      An encryption and authentication library for ZeroMQ applications
    - [rtrlib](http://rtrlib.realmv6.org/) 0.5.0
      An open-source C implementation of the RPKI/Router Protocol client
  - net-misc
    - [bird](http://bird.network.cz) 2.0.1
      A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 or IPv6
    - [cni-plugins](https://github.com/containernetworking/plugins) 0.7.1
      Some standard networking plugins, maintained by the CNI team
    - [frr](https://frrouting.org/) 5.0
      an IP routing protocol suite for BGP, IS-IS, LDP, OSPF, PIM, and RIP
    - [openvswitch](http://openvswitch.org) 2.9.2
      Production quality, multilayer virtual switch
  - net-proxy
    - [seesaw](https://github.com/google/seesaw) 9999
      Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform
  - net-vpn
    - [strongswan](http://www.strongswan.org/) 5.6.3
      IPsec-based VPN solution focused on security and ease of use, supporting IKEv1/IKEv2 and MOBIKE
  - sys-cluster
    - [nomad](http://www.nomadproject.io) 0.8.0
      The cluster manager from Hashicorp
  - www-apps
    - [gitea](https://github.com/go-gitea/gitea) 1.4.3
      A painless self-hosted Git service, written in Go
  - www-servers
    - [nginx](https://nginx.org) 1.14.0
      Robust, small and high performance http and reverse proxy server
  - x11-themes
    - [albatross](http://shimmerproject.org/projects/albatross/) 1.7.4
      Desktop Suite for Xfce
