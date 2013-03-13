==========================
The Phoenix Funtoo Overlay
==========================

:keywords: webauth, sso, single sign on, kerberos, ldap, dns, openvswitch, drbd, funtoo, gentoo, ebuild
:description: 
   
        An overlay for a dynamic/symantic source based distro
         
:author: Daniel Molik
:contact: dan@runedrive.com
:copyright: GPL-2
:language: English

Introduction
============

        Ebuilds for sematic web stacks 
        Single Sign On (SSO) (Webauth) webauth ebuild
        Big Data
         
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
        
   Big Data
         1) Apache Activemq
         2) Apache Hive
         3) Apache Mesos
         4) Spark
         5) Apache Giraphe
         6) Shark
         7) Apache Mahout
         8) Apache Pig
   Virtualization
         1) Fog
