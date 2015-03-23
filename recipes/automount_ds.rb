#
# Cookbook Name:: autofs-nativex
# Recipe:: automount_ds
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

automaster_entry '/automnt', '/etc/lwi_automount/auto.nas' do
  options '--timeout 600'
end