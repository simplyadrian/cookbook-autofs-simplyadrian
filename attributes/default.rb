# Dynamic NAS FQDN
include_recipe "ohai-nativex::default" if node['cloud']['provider'] == 'ec2'
  us-east1-nas = "PAE1AL-NAS-03-prv.nativexintern.com"
  us-west1-nas = "PAW1AL-NAS-01-prv.nativexintern.com"
  us-west2-nas = "PAW2AL-NAS-02-prv.nativexintern.com"
else
  cdc-nas = "://nas/"
end

# Default value for NAS FQDN
default['autofs-nativex']['server'] = us-east1-nas
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									   :key => 'TEAMFREEZE'
									   :source => '/etc/auto.TEAMFREEZE',
									   :options => '-rw,intr,rsize=8192,wsize=8192',
									   :export => '/mnt/ebs'}]