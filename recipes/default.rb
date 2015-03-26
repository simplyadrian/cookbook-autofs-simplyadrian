#
# Cookbook Name:: autofs-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Install autofs for mounting home directories.
case node[:platform]
when 'debian','ubuntu'
  package 'autofs-ldap'
  package 'ldap-utils'
when 'redhat','centos','fedora','amazon'
  package 'autofs'
end

# Reload autofs service
service "autofs" do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start, :reload]
end

file '/etc/auto.direct' do
  owner 'root'
  group 'root'
  mode 0640

  action :create_if_missing
  notifies :restart, 'service[autofs]'
end

file '/etc/auto.master' do
  owner 'root'
  group 'root'
  mode 0644

  action :create_if_missing
  notifies :restart, 'service[autofs]'
end

# Ensure the following line exists in auto.master
# /- /etc/auto.direct --timeout=3600

ruby_block 'autofs.direct' do
  block do
    rc = Chef::Util::FileEdit.new('/etc/auto.master')
    rc.insert_line_if_no_match(/^\/\-/, "/- /etc/auto.direct --timeout=#{node['automount']['timeout']}")
    rc.search_file_replace_line(/^\/\-/, "/- /etc/auto.direct --timeout=#{node['automount']['timeout']}")
    rc.write_file
  end
  notifies :restart, 'service[autofs]'
end
