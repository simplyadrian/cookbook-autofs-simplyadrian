#
# Cookbook Name:: autofs-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# If we're in EC2, then need to dynamically determine the NAS based on region

if File.directory?('/etc/pbis')
  Chef::Log.error('PBIS is installed, skipping adcli/SSSD domain configuration.')
else

  include_recipe 'autofs-nativex::dynamic_nas'

  # Install autofs for mounting home directories.
  case node[:platform]
  when 'debian','ubuntu'
    package 'autofs-ldap'
    package 'ldap-utils'
  when 'redhat','centos','fedora','amazon'
    package 'autofs'
  else
    Chef::Log.warn('Unknown platform! autofs must be installed manually.')
  end

  # Reload autofs service
  service "autofs" do
    supports [ :status => true, :start => true, :stop => true, :restart => true, :reload => true ]
    action [:enable, :start]
  end

  template "/etc/auto.master" do
    source "auto.master.erb"
    owner "root"
    group "root"
    mode "0644"
    notifies :reload, resources(:service => "autofs"), :immediately
  end

  node['autofs-nativex']['maps'].each do |map|
    template map[:source] do
      owner "root"
      group "root"
      mode 0644
      source "auto.map.erb"
      notifies :reload, resources(:service => "autofs"), :immediately
    end
  end

end