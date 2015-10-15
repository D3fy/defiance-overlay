# The Phoenix Overlay

The beginnings of a meta distribution

## Introduction

This overlay is the result of my internet wanderings and work experiance.
My hope is that other people can benifit from whatever I have learned.
It has morphed from a youthful and naive big-data dream into a c10k and sso overlay.

Additionally, this repo is the beginnings of the Defiance Linux (d3fynix) distribution.
Which will be opionated, but effort will be made to keep it clean and fast.

## Installation

For Portage >= 2.3.8
	cd /usr/local && git clone https://github.com/GrayTShirt/phoenix-overlay.git
	echo -e "[phoenix]\nlocation = /usr/local/phoenix-overlay\nsync-type = git\nsync-uri  = https://github.com/graytshirt/phoenix-overlay.git\nauto-sync = true" >> /etc/portage/repos.conf/phoenix

For Portage <  2.3.8
	cd /usr/local && git clone https://github.com/GrayTShirt/phoenix-overlay.git
	echo "PORTDIR_OVERLAY=\"\${PORTDIR_OVERLAY} /usr/local/phoenix-overlay\"" >> /etc/make.conf
	echo "\!echo -e \" \\\e[1;32m*\\\e[0m Updating Phoenix-Overlay\" && cd /usr/local/phoenix-overlay && git pull" >> /etc/eix-sync.conf
