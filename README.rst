==========================
The Phoenix Gentoo/Funtoo Overlay
==========================

:keywords: webauth, sso, funtoo, gentoo, ebuild, perl, dancer
:description:

    The beginnings of a meta distribution

:author: Daniel Molik
:contact: dan@runedrive.com
:copyright: GPL-2
:language: English

Introduction
============

    This overlay is the result of my internet wanderings and work experiance over the
    last few years. I hope that other people can benifit from whatever I have learned.
    It has morphed from a youthful and naive big-data dream into a c10k and sso overlay.

    Additionally, this repo is the beginnings of the Defiance Linux (d3fynix) distribution.
    Which will be opionated, but effort will be made to keep it clean and fast.

Installation
============

    ::

        cd /usr/local && git clone https://github.com/GrayTShirt/phoenix-overlay.git
        echo "PORTDIR_OVERLAY=\"/usr/local/phoenix-overlay\"" >> /etc/make.conf
        echo -e "@emerge --regen --quiet
        @egencache --repo=Phoenix --update
        !cd /usr/local/portage && git pull" > /etc/eix-sync.conf

TODO
====

    The current todo list includes:
        1) Dancer-Auth-Krb5-Simple
        2) Dancer-Auth-Krb5(-complete)? I or someone else has to write this
        3) Dancer-Plugin-Memcache
        4) Monoceros
        5) Dancer2 & Dancer2 plugins, namely dbic, cache and queue
