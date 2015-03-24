#
# Cookbook Name:: autofs-nativex
# Recipe:: automount_home
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

map_entry 'homes' do
  location "#{node['autofs-nativex']['nas_name']}:/mnt/ebs"
  fstype 'nfs4'
  options 'rw'
  map '/etc/auto.TEAMFREEZE'
end

automaster_entry '/home', '/etc/auto.TEAMFREEZE' do
  options '--timeout 300'
end