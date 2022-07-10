# Update the package references
apt-get update

# Install nginx and supporting packages
apt-get install -y nginx

# Install apache-utils
apt-get install -y apache2-utils

# Load the configuration
systemctl reload nginx
