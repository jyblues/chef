cd ~
curl -L https://www.opscode.com/chef/install.sh | bash
chef-solo -v

wget http://github.com/opscode/chef-repo/tarball/master
tar -zxf master
mv chef-chef-repo* chef-repo
rm master

cd chef-repo/
mkdir .chef
echo "cookbook_path [ '/root/chef-repo/cookbooks' ]" >> .chef/knife.rb

knife cookbook create gameserver

cd cookbooks/gameserver

cd ..

knife cookbook site download nginx
tar zxf nginx*
rm nginx*.tar.gz

cd gameserver

echo 'depends "nginx"' >> ~/chef-repo/cookbooks/gameserver/metadata.rb

echo 'include_recipe "nginx"' >> ~/chef-repo/cookbooks/gameserver/recipes/default.rb
echo 'apache_site "default" do' >> ~/chef-repo/cookbooks/gameserver/recipes/default.rb
echo '  enable true' >> ~/chef-repo/cookbooks/gameserver/recipes/default.rb
echo end >> ~/chef-repo/cookbooks/gameserver/recipes/default.rb

cd ../..

echo 'file_cache_path "/root/chef-solo"' >> ~/chef-repo/solo.rb
echo 'cookbook_path "/root/chef-repo/cookbooks"' >> ~/chef-repo/solo.rb

echo { >> ~/chef-repo/localhost.json
echo ' "run_list": [ "recipe[nginx]", "recipe[gameserver]" ]' >> ~/chef-repo/localhost.json
echo } >> ~/chef-repo/localhost.json

chef-solo -c solo.rb -j localhost.json
