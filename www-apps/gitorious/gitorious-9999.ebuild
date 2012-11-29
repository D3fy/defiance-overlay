# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-servers/nginx/nginx-0.7.62.ebuild,v 1.3 2009/09/18 19:22:29 keytoaster Exp $
EAPI=2

DESCRIPTION="Gitorious aims to provide a great way of doing distributed opensource code collaboration."

HOMEPAGE="http://gitorious.org/gitorious"
LICENSE="AGPLv3"
SLOT="0"
KEYWORDS="amd64"

EGIT_REPO_URI="git://gitorious.org/gitorious/mainline.git"
inherit git

DEST_DIR="/var/www/gitorious/site/"
HOME_DIR="/var/www/gitorious"
USER="git"

DEPEND=">=dev-vcs/git-1.6.4.4
	dev-ruby/stompserver
	>=dev-lang/ruby-1.8.7[threads]
	>=app-misc/sphinx-0.9.8[mysql]
	dev-ruby/bundler
	>=www-servers/nginx-0.7.65-r1[nginx_modules_http_proxy,nginx_modules_http_rewrite,nginx_modules_http_gzip]
	>=net-misc/memcached-1.4.1
	>=dev-db/mysql-5.0"
RDEPEND="${DEPEND}"

pkg_nofetch()
{
	einfo "You need to download http://gitorious.org/gitorious/mainline/archive-tarball/master to ${DISTDIR}/gitorious-master.tar.gz before continuing."
       	einfo "You can use 'wget -O ${DISTDIR}/gitorious-master.tar.gz http://gitorious.org/gitorious/mainline/archive-tarball/master' to do this"
}

pkg_setup() {
	ebegin "Creating gitorious user and group"
	enewgroup ${USER}
	enewuser ${USER} -1 /bin/bash ${HOME_DIR} ${USER}",cron,crontab"
	eend ${?}
}

src_unpack() { 
	git_src_unpack 
}

src_install() {
	insinto "${DEST_DIR}"
	doins -r .
}

pkg_postinst() {
        # replace the default configuration files
        cp "${FILESDIR}"/gitorious.yml "${DEST_DIR}"config/
        cp "${FILESDIR}"/database.yml "${DEST_DIR}"config/
        cp "${FILESDIR}"/broker.yml "${DEST_DIR}"config/
        cp "${FILESDIR}"/environment.rb  "${DEST_DIR}"config/
        cp "${FILESDIR}"/createdb.sql  "${DEST_DIR}"config/
        cp "${FILESDIR}"/production.conf  "${DEST_DIR}"config/ultrasphinx/
        cp -r "${FILESDIR}"/cert /etc/nginx
        cp "${FILESDIR}"/nginx.conf  /etc/nginx/nginx.conf
        cp "${FILESDIR}"/.bashrc /var/www/gitorious
	cp "${FILESDIR}"/gitorious /etc/init.d/
        cp "${FILESDIR}"/gitorious-poller /etc/init.d/
        cp "${FILESDIR}"/gitorious-git-daemon /etc/init.d/
        cp "${FILESDIR}"/run-git-daemon  "${DEST_DIR}"script/run-git-daemon
	cp "${FILESDIR}"/thin.yml "${DEST_DIR}"
	cp "${FILESDIR}"/Gemfile "${DEST_DIR}"

        chmod -R 770 "${DEST_DIR}"script

        cp "${FILESDIR}"/cookie_secret.sh  "${DEST_DIR}"config/
        cp "${FILESDIR}"/createdb.sql  "${DEST_DIR}"config/

	echo "run 'emerge --config =${CATEGORY}/${PF}' in order to configure the setup"
}

pkg_config() {
        # check if mysql is running and configured
        if ! ps ax | grep -v grep | grep "mysql" > /dev/null; then
                einfo "MySql is not running."
                exit 1
        fi

        # check if mysql is configured
        if [ ! -d "${ROOT}"/var/lib/mysql/mysql ] ; then
                einfo "MySql has not been configured yet - please do so using 'emerge --config dev-db/mysql' and rerun this configuration"
                exit 1
        fi

        # get the domain name
        echo "Please set the wanted domain name for Gitorious:"
        read DOMAIN
        sed -i -e "s~git.localhost~${DOMAIN}~g" "${ROOT}${DEST_DIR}"/config/gitorious.yml
        sed -i -e "s~git.localhost~${DOMAIN}~g" ${ROOT}/etc/nginx/nginx.conf

        echo "Please set the email address that error messages etc should be sent to:"
        read EMAIL
        sed -i -e "s~support@localhost~${EMAIL}~g" "${ROOT}"/var/www/gitorious/site/config/gitorious.yml
        echo "Make sure sendmail is working (check the mailhub setting in /etc/ssmtp/ssmtp.conf if you are using SSMTP)."

        # install the required gems
        cd "${ROOT}${DEST_DIR}" 
        bundle install

        # generate a cookie secret
        "${ROOT}${DEST_DIR}"config/cookie_secret.sh

        # set up the database
        echo "We will now create the needed database and user"
        echo "Please supply your mysql root password at the prompt"
        mysql -uroot -p < "${ROOT}${DEST_DIR}"/config/createdb.sql

        cd "${ROOT}${DEST_DIR}"
	bundle exec rake db:create RAILS_ENV=production
        bundle exec rake db:migrate RAILS_ENV=production
	
	bundle exec rake ultrasphinx:configure RAILS_ENV=production
	sed -i -e "s~base_tags~tags~g" "${ROOT}${DEST_DIR}"/config/ultrasphinx/production.conf
	bundle exec rake ultrasphinx:index RAILS_ENV=production

        # add the crontab which runs ultrasphinx (should be converted to a daemon)
        crontab -u git "${ROOT}${DEST_DIR}"/crontab

        # set up needed directories and files
        mkdir "${ROOT}${HOME_DIR}"/tmp
        mkdir "${ROOT}${HOME_DIR}"/tarballs
        mkdir "${ROOT}${HOME_DIR}"/repositories
        mkdir "${ROOT}${HOME_DIR}"/pids
        mkdir "${ROOT}${HOME_DIR}"/site/tmp/pids
        mkdir "${ROOT}${HOME_DIR}"/.ssh
        touch "${ROOT}${HOME_DIR}"/.ssh/authorized_keys

	echo "We will now create the Gitorious admin user"
	RAILS_ENV=production ruby script/create_admin

        chown -R git:git "${ROOT}${HOME_DIR}"
        chmod 700 "${ROOT}${HOME_DIR}"/.ssh
        chmod 600 "${ROOT}${HOME_DIR}"/.ssh/authorized_keys
        chmod 744 "${ROOT}${HOME_DIR}"/site/data/hooks/pre*
        chmod 744 "${ROOT}${HOME_DIR}"/site/data/hooks/post*

        echo "Services need to be started are: mysql, nginx, stompserver, memcached, gitorious, gitorious-git-daemon and gitorious-poller"

}

