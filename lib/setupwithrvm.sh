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
gpasswd -a vagrant rvm
source /etc/profile.d/rvm.sh
rvm install 2.4.1

echo "Installing NodeJS"
sudo yum install -y nodejs > /dev/null

echo "Installing Postgresql"
sudo yum install -y postgresql postgresql-contrib postgresql-server \
postgresql-devel > /dev/null

echo "Creating PostgresDB and Initializing Postgresql"
sudo postgresql-setup initdb && systemctl start postgresql
sudo systemctl enable postgresql

echo "Creating user and vagrant database"
sudo -u postgres createdb vagrant

echo "Go to project folder, install bundler"
cd /vagrant
bundle install
rails s
