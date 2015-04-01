#
# Cookbook Name:: autofs-nativex
# Recipe:: dynamic_nas
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ohai-nativex::default" if node['cloud']['provider'] == 'ec2'

ruby_block "determine_ec2_region_and_set_nas" do
  block do
    case node['aws']['region']
      when 'us-east-1'
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['us-east1']}"
      when 'us-west-1'
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['us-west1']}"
      when 'us-west-2'
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['us-west2']}"
     else
      Chef::Log.warn("Undefined AWS region! Cannot automatically set the proper NAS FQDN.")
    end
  end
  action :run
  only_if { node['cloud']['provider'] == 'ec2' }
end