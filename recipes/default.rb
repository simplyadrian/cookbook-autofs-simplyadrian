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

template "/etc/auto.master" do
  source "auto.master.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :reload, resources(:service => "autofs"), :immediately
end

node[:autofs][:maps].each do |map, args|
  template args[:source].gsub(/file:/, '') do
    owner "root"
    group "root"
    mode 0644
    source "auto.map.erb"
    variables(:keys => args[:keys])
    notifies :reload, resources(:service => "autofs"), :immediately
  end
end