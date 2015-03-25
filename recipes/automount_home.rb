#
# Cookbook Name:: autofs-nativex
# Recipe:: automount_home
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# If we're in EC2, then need to dynamically determine the the NAS by region
include_recipe 'autofs-nativex::dynamic_nas' if node['cloud']['provider'] == 'ec2'

map_entry 'homes' do
  location lazy { "#{node['autofs-nativex']['nas_name']}:/mnt/ebs" }
  fstype 'nfs4'
  options 'rw'
  map '/etc/auto.TEAMFREEZE'
end

automaster_entry '/home', '/etc/auto.TEAMFREEZE' do
  options '--timeout 300'
end