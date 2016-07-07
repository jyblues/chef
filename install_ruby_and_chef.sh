sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
cd ~
git clone https://github.com/jyblues/chef.git
sudo chmod +x ./chef/gameserver.sh
sudo chmod +x ./chef/test.sh
sudo chmod +x ./chef/install_ruby_and_chef.sh
