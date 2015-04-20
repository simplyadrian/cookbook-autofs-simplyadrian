#
# Cookbook Name:: autofs-nativex
# Recipe:: dynamic_nas
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ohai-nativex::default" if node['cloud']['provider'] == 'ec2'

if node['cloud']['provider'] == 'ec2'

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

else

  # TODO: Remove hardcoded values if cookbook is open sourced.
  ruby_block 'machine_is_on-premise_set_to_cdc_nas' do
    block do
      hostname = node['hostname']
      if hostname.include? 'CHD'
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['cdc']}"
      elsif hostname.include? 'SHO'
        node.default['autofs-nativex']['server'] = "#{node['autofs-nativex']['cdc']}"
      else
        Chef::Log.warn('Undefined physical server! Cannot automatically set the proper NAS FQDN.')
      end
    action :run
  end

end