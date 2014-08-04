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
