#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

## java install
package "httpd" do
  action :install
end

## service start
service "httpd" do
  action [ :enable, :start ]
end

## kibana install
## install
remote_file "#{Chef::Config[:file_cache_path]}/kibana-3.1.0.tar.gz" do
  source "https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz"
  action :create
end

bash "kibana" do
  user "root"
  cwd "/var/www/html"
  code <<-EOH
    tar xvzf #{Chef::Config[:file_cache_path]}/kibana-3.1.0.tar.gz -C /var/www/html
    ln -s kibana-3.1.0 kibana
  EOH
end

## directory
directory '/var/www/html/kibana' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

## kibana config setting
#template "/var/www/html/kibana/config.js" do
#  source "config.js.erb"
#  owner "root"
#  group "root"
#  mode 755
#end