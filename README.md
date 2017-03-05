# The Defiance Overlay

The beginnings of a meta distribution

## Introduction

This overlay is the result of my internet wanderings and work experiance.
My hope is that other people can benifit from whatever I have learned.
It has morphed from a youthful and naive big-data dream into a c10k and sso overlay.

Additionally, this repo is the beginnings of the Defiance Linux (d3fynix) distribution.
Which will be opionated, but effort will be made to keep it clean and fast.

## Installation

For Portage >= 2.3.8:

	cd /usr/local && git clone https://github.com/d3fy/defiance-overlay.git
	echo -e "[defiance]\nlocation = /usr/local/defiance-overlay\nsync-type = git\nsync-uri  = https://github.com/d3fy/defiance-overlay.git\nauto-sync = true" >> /etc/portage/repos.conf/defiance.conf


For Portage <  2.3.8:

	cd /usr/local && git clone https://github.com/d3fy/defiance-overlay.git
	echo "PORTDIR_OVERLAY=\"\${PORTDIR_OVERLAY} /usr/local/defiance-overlay\"" >> /etc/make.conf
	echo "\!echo -e \" \\\e[1;32m*\\\e[0m Updating Defiance-Overlay\" && cd /usr/local/defiance-overlay && git pull" >> /etc/eix-sync.conf
