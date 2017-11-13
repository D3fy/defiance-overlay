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

For Portage >= 2.3.8:

	cd /usr/local && git clone https://github.com/d3fy/defiance-overlay.git
	echo -e "[defiance]\nlocation = /usr/local/defiance-overlay\nsync-type = git\nsync-uri  = https://github.com/d3fy/defiance-overlay.git\nauto-sync = true" >> /etc/portage/repos.conf/defiance.conf

## List of Ebuilds

    .
    ├── app-admin
    │   ├── clockwork
    │   │   ├── clockwork-3.3.0.ebuild
    │   │   └── clockwork-9999.ebuild
    │   └── helm-bin
    │       └── helm-bin-2.5.0.ebuild
    ├── app-misc
    │   └── ztk
    │       └── ztk-9999.ebuild
    ├── dev-db
    │   ├── citus
    │   │   └── citus-7.0.3.ebuild
    │   ├── hypopg
    │   │   └── hypopg-1.1.0.ebuild
    │   ├── pg_qualstats
    │   │   └── pg_qualstats-1.0.2.ebuild
    │   ├── pg_stat_kcache
    │   │   └── pg_stat_kcache-2.0.3.ebuild
    │   ├── postgresql-hll
    │   │   └── postgresql-hll-2.10.2.ebuild
    │   ├── powa
    │   │   └── powa-3.1.1.ebuild
    │   ├── powa-web
    │   │   └── powa-web-3.1.4.ebuild
    │   └── timescaledb
    │       └── timescaledb-9999.ebuild
    ├── dev-libs
    │   ├── ctap
    │   │   └── ctap-2.0.0.ebuild
    │   ├── libmill
    │   │   └── libmill-1.18.ebuild
    │   ├── libspooky
    │   │   └── libspooky-1.0.0.ebuild
    │   └── libvigor
    │       └── libvigor-1.2.10.ebuild
    ├── dev-perl
    │   ├── Authen-OATH
    │   │   └── Authen-OATH-1.0.0.ebuild
    │   ├── Authen-SASL-XS
    │   │   └── Authen-SASL-XS-1.00.ebuild
    │   ├── Dancer
    │   │   └── Dancer-1.3202.ebuild
    │   ├── Directory-Scratch
    │   │   └── Directory-Scratch-0.18.ebuild
    │   ├── ExtUtils-ModuleMaker
    │   │   └── ExtUtils-ModuleMaker-0.56.ebuild
    │   ├── File-Save-Home
    │   │   └── File-Save-Home-0.09.ebuild
    │   ├── Gazelle
    │   │   └── Gazelle-0.46.ebuild
    │   ├── Git-Repository
    │   │   └── Git-Repository-1.320.ebuild
    │   ├── Krb5
    │   │   └── Krb5-1.9.ebuild
    │   ├── Net-GitHub
    │   │   └── Net-GitHub-0.89.ebuild
    │   ├── Net-OAuth2
    │   │   └── Net-OAuth2-0.63.ebuild
    │   ├── Redis-hiredis
    │   │   └── Redis-hiredis-0.11.0.ebuild
    │   ├── String-PerlIdentifier
    │   │   └── String-PerlIdentifier-0.06.ebuild
    │   └── System-Command
    │       └── System-Command-1.118.ebuild
    ├── dev-util
    │   ├── ostree
    │   │   └── ostree-2017.13.ebuild
    │   └── ragel
    │       ├── ragel-6.10-r1.ebuild
    │       └── ragel-6.9-r1.ebuild
    ├── net-analyzer
    │   ├── bolo
    │   │   ├── bolo-0.3.0.ebuild
    │   │   └── bolo-9999.ebuild
    │   └── bolo-collectors
    │       ├── bolo-collectors-0.4.13.ebuild
    │       └── bolo-collectors-9999.ebuild
    ├── net-dns
    │   └── bind-dyndb-ldap
    │       ├── bind-dyndb-ldap-11.1.ebuild
    │       └── bind-dyndb-ldap-9999.ebuild
    ├── net-libs
    │   └── libcurve
    │       └── libcurve-9999.ebuild
    ├── net-misc
    │   └── frr
    │       ├── frr-3.0_rc1.ebuild
    │       └── frr-9999.ebuild
    ├── net-proxy
    │   └── seesaw
    │       └── seesaw-9999.ebuild
    ├── sys-cluster
    │   ├── glusterfs
    │   │   └── glusterfs-3.12.2.ebuild
    │   └── nomad
    │       └── nomad-0.7.0.ebuild
    └── x11-themes
        └── albatross
            └── albatross-1.7.4.ebuild
