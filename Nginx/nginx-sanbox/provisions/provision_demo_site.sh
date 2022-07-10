#install unzip
apt install unzip

# Install the demo site
mkdir /var/www/mysite.local
unzip /vagrant/data/Wisdom_Pet_Medicine_responsive_website_LYNDA_12773.zip -d /var/www/mysite.local
find /var/www/mysite.local -type f -exec chmod 644 {} \; -print
find /var/www/mysite.local -type d -exec chmod 755 {} \; -print

# Load the configuration
systemctl reload nginx
