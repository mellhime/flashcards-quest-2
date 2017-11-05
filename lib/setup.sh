echo "Upgrading the system"
sudo yum upgrade > /dev/null

echo "Installing Project Dependencies"
sudo yum install -y autoconf bison openssl-devel libyaml-devel \
readline-devel zlib-devel ncurses-devel libffi-devel gdbm-devel git \
curl epel-release > /dev/mnull
sudo yum groups mark install "Development Tools"
sudo yum groupinstall -y "Development Tools" > /dev/null

echo "Installing rvm and Configuring ruby 2.4"
sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.4.1

echo "Installing NodeJS"
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
sudo yum install -y nodejs > /dev/null

echo "Installing Postgresql"
sudo yum install -y postgresql postgresql-contrib postgresql-server

echo "Creating PostgresDB and Initializing Postgresql"
sudo yum -y install http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-redhat95-9.5-2.noarch.rpm
sudo yum -y install postgresql-devel postgresql95-server postgresql95-contrib
sudo /usr/pgsql-9.5/bin/postgresql95-setup initdb
sudo systemctl start postgresql-9.5.service
sudo systemctl enable postgresql-9.5.service
sudo -u postgres createdb library2_development
sudo -u postgres createuser vagrant -s

echo "Go to project folder, install bundler"
cd /vagrant
gem install bundler
bundle install
rake db:migrate
rails s -b 0.0.0.0
