#
# Cookbook Name:: autofs-nativex
# Recipe:: automount_home
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# TODO: Region detection for region NAS mounts.

automaster_entry '/home', '/etc/lwi_automount/auto.TEAMFREEZE' do
  options '--timeout 600'
end