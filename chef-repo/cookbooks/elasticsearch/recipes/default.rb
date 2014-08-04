#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

## java install
package "java-1.7.0-openjdk" do
  action :install
end

## install
remote_file "#{Chef::Config[:file_cache_path]}/elasticsearch-1.3.1.noarch.rpm" do
  source "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.noarch.rpm"
  action :create
end

bash "elasticsearch" do
  code <<-EOH
    yum localinstall -y #{Chef::Config[:file_cache_path]}/elasticsearch-1.3.1.noarch.rpm
  EOH
end

## service start
service "elasticsearch" do
  action [ :enable, :start ]
end
