#/bin/bash

cookie_secret="cookie_secret: "$(uuidgen)
echo "  "$cookie_secret >> /var/www/gitorious/site/config/gitorious.yml
