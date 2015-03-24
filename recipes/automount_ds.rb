#
# Cookbook Name:: autofs-nativex
# Recipe:: automount_ds
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

map_entry 'datascience' do
  location '://nas:MobilePredictionStaging'
  fstype 'cifs'
  options 'rw'
  map '/etc/auto.nas'
end

automaster_entry '/automnt', '/etc/lwi_automount/auto.nas' do
  options '--timeout 300'
end