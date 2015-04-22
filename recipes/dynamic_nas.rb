#
# Cookbook Name:: autofs-nativex
# Recipe:: dynamic_nas
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

if ec2?

  include_recipe 'ohai-nativex::default'

  ruby_block 'determine_ec2_region_and_set_nas' do
    block do
      if node['aws']['region'].nil?
        Chef::Log.warn('Undefined AWS region! Cannot automatically set the proper NAS FQDN.')
      else
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']["#{node['aws']['region']}"]}"
      end
    end
    action :run
  end

else

  # TODO: Remove hardcoded values if cookbook is open sourced.
  ruby_block 'machine_is_on-premise_set_to_cdc_nas' do
    block do
      hostname = node['hostname'].upcase
      if hostname.include?('CHD') || hostname.include?('SHO')
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['cdc']}"
      else
        Chef::Log.warn('Undefined physical server! Cannot automatically set the proper NAS FQDN.')
      end
    end
    action :run
  end

end