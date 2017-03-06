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
