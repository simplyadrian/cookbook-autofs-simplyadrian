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
        node.default['autofs-nativex']['nas_name'] = "PAE1AL-NAS-03-prv.nativexintern.com"
      when 'us-west-1'
        node.default['autofs-nativex']['nas_name'] = "PAW1AL-NAS-01-prv.nativexintern.com"
      when 'us-west-2'
        node.default['autofs-nativex']['nas_name'] = "PAW2AL-NAS-02-prv.nativexintern.com"
    end
    else
      Chef::Log.warn("Undefined AWS region! Cannot automatically set the proper NAS.")
    end
  end
  action :run
  only_if { node['cloud']['provider'] == 'ec2' }
end