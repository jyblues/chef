cd ~
curl -L https://www.opscode.com/chef/install.sh | bash
chef-solo -v

# chef-dk install..
# cd ~
# wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.4.0-1.x86_64.rpm
# rpm -ivh chefdk-0.4.0-1.x86_64.rpm 

# chef-repo init
chef generate repo chef-repo

# knife setting
knife configure

# cookbook generate
cd chef-repo
knife cookbook create gameserver -o cookbooks

# recipe.json 
echo '// localhost.json' >> /root/chef-repo/localhost.json
echo '{' >> /root/chef-repo/localhost.json
echo '  "run_list": [' >> /root/chef-repo/localhost.json
echo '    "recipe[nginx]"' >> /root/chef-repo/localhost.json
echo '    ]' >> /root/chef-repo/localhost.json
echo '}' >> /root/chef-repo/localhost.json

# recipe.ruby(/root/chef-repo/solo.rb)
echo 'file_cache_path "/tmp/chef-solo"' >> /root/chef-repo/solo.rb
echo 'cookbook_path ["/root/chef-repo/cookbooks"]' >> /root/chef-repo/solo.rb

# chef execute
sudo chef-solo -c solo.rb -j localhost.rb
