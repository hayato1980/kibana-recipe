#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "treasuredatarepository" do
  code <<-EOH
  # add GPG key
  rpm --import http://packages.treasuredata.com/GPG-KEY-td-agent

  # add treasure data repository to yum
  cat >/etc/yum.repos.d/td.repo <<'EOF';
[treasuredata]
name=TreasureData
baseurl=http://packages.treasuredata.com/redhat/\$basearch
gpgcheck=1
gpgkey=http://packages.treasuredata.com/GPG-KEY-td-agent
EOF
  EOH
end

package "td-agent" do
  version "1.1.19-0"
  action :install
end

template "/etc/td-agent/td-agent.conf" do
  owner "root"
  mode 0644
end

## directory
directory '/var/log/httpd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

## service start
service "td-agent" do
  action [ :enable, :restart ]
end



# for collector
package "libcurl-devel" do
  action :install
end

package "gcc" do
  action :install
end

bash "fluent-plugin-elasticsearch" do
  code <<-EOH
    /usr/lib64/fluent/ruby/bin/gem install fluent-plugin-elasticsearch
  EOH
end
