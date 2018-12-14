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
    - [heketi](https://github.com/heketi/heketi) -  [8.0.0](/app-admin/heketi/heketi-8.0.0.ebuild) -
      RESTful based volume management framework for GlusterFS
    - [terraform](https://www.terraform.io/) -  [0.11.10](/app-admin/terraform/terraform-0.11.10.ebuild) -
      Terraform is a tool for building, changing, and combining infrastructure safely and efficiently.
  - [app-emulation](https://packages.gentoo.org/categories/app-emulation)
    - [cri-o](http://cri-o.io/) -  [1.13.0](/app-emulation/cri-o/cri-o-1.13.0.ebuild) -
      Lightweight container runtime for Kubernetes
    - [kvmtool](https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/) -  [9999](/app-emulation/kvmtool/kvmtool-9999.ebuild) -
      A lightweight tool for hosting KVM guests
    - [runv](https://github.com/hyperhq/runv) -  [1.0.0](/app-emulation/runv/runv-1.0.0.ebuild) -
      Hypervisor-based Runtime for OCI
  - [dev-db](https://packages.gentoo.org/categories/dev-db)
    - [citus](https://www.citusdata.com/) -  [8.0.0](/dev-db/citus/citus-8.0.0.ebuild) -
      Scalable PostgreSQL for multi-tenant and real-time workloads
    - [hypopg](http://hypopg.github.io/hypopg/) -  [1.1.2](/dev-db/hypopg/hypopg-1.1.2.ebuild) -
      Hypothetical Indexes for PostgreSQL
    - [pg_jobmon](https://github.com/omniti-labs/pg_jobmon) -  [1.3.3](/dev-db/pg_jobmon/pg_jobmon-1.3.3.ebuild) -
      PostgreSQL Extension for logging and monitoring automated jobs
    - [pg_partman](https://github.com/keithf4/pg_partman) -  [3.1.1](/dev-db/pg_partman/pg_partman-3.1.1.ebuild) -
      Postgres time and serial partitioner
    - [pg_pathman](https://github.com/postgrespro/pg_pathman) -  [1.4.9](/dev-db/pg_pathman/pg_pathman-1.4.9.ebuild) -
      Partitioning tool for PostgreSQL
    - [pg_qualstats](https://github.com/powa-team/pg_qualstats) -  [1.0.5](/dev-db/pg_qualstats/pg_qualstats-1.0.5.ebuild) -
      A Postgres extension for collecting statistics about predicate
    - [pg_stat_kcache](https://github.com/powa-team/pg_stat_kcache) -  [2.1.1](/dev-db/pg_stat_kcache/pg_stat_kcache-2.1.1.ebuild) -
      Gather statistics about disk access and CPU consumption done by backends
    - [postgresql-hll](https://github.com/citusdata/postgresql-hll) -  [2.11](/dev-db/postgresql-hll/postgresql-hll-2.11.ebuild) -
      PostgreSQL extension adding HyperLogLog data structures as a native data type
    - [powa](http://powa-team.github.io/powa/) -  [3.1.2](/dev-db/powa/powa-3.1.2.ebuild) -
      PostgreSQL Workload Analyzer
    - [powa-web](http://powa.readthedocs.io/en/latest/powa-web/index.html) -  [3.1.4](/dev-db/powa-web/powa-web-3.1.4.ebuild) -
      The PostgreSQL Workload Analyzer web frontend
    - [timescaledb](http://www.timescale.com/) -  [1.0.1](/dev-db/timescaledb/timescaledb-1.0.1.ebuild) -
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
    - [ostree](https://ostree.readthedocs.io/en/latest/) -  [2018.9](/dev-util/ostree/ostree-2018.9.ebuild) -
      Operating system and container binary deployment and upgrades
    - [packer](http://www.packer.io) -  [1.3.2](/dev-util/packer/packer-1.3.2.ebuild) -
      Packer is a tool for creating identical machine images for multiple platforms
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
  - [net-proxy](https://packages.gentoo.org/categories/net-proxy)
    - [seesaw](https://github.com/google/seesaw) -  [9999](/net-proxy/seesaw/seesaw-9999.ebuild) -
      Seesaw v2 is a Linux Virtual Server (LVS) based load balancing platform
  - [net-vpn](https://packages.gentoo.org/categories/net-vpn)
    - [strongswan](http://www.strongswan.org/) -  [5.7.1](/net-vpn/strongswan/strongswan-5.7.1.ebuild) -
      IPsec-based VPN solution focused on security and ease of use, supporting IKEv1/IKEv2 and MOBIKE
  - [sys-cluster](https://packages.gentoo.org/categories/sys-cluster)
    - [kubelet](https://github.com/kubernetes/kubernetes https://kubernetes.io) -  [1.13.1](/sys-cluster/kubelet/kubelet-1.13.1.ebuild) -
      Kubernetes Node Agent
    - [nomad](http://www.nomadproject.io) -  [0.8.0](/sys-cluster/nomad/nomad-0.8.0.ebuild) -
      The cluster manager from Hashicorp
  - [www-apps](https://packages.gentoo.org/categories/www-apps)
    - [gitea](https://gitea.io/en-us/) -  [1.5.1](/www-apps/gitea/gitea-1.5.1.ebuild) -
      A painless self-hosted Git service, written in Go
  - [www-servers](https://packages.gentoo.org/categories/www-servers)
    - [nginx](https://nginx.org) -  [1.14.1](/www-servers/nginx/nginx-1.14.1.ebuild) [1.15.7](/www-servers/nginx/nginx-1.15.7.ebuild) -
      Robust, small and high performance http and reverse proxy server
  - [x11-themes](https://packages.gentoo.org/categories/x11-themes)
    - [albatross](http://shimmerproject.org/projects/albatross/) -  [1.7.4](/x11-themes/albatross/albatross-1.7.4.ebuild) -
      Desktop Suite for Xfce
