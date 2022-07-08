sudo yum update
sudo yum install -y nginx

sudo systemctl enable nginx
sudo systemctl start nginx

sudo systemctl disable firewalld
sudo systemctl stop firewalld