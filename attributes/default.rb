# US-East NAS FQDN
default['autofs-nativex']['us-east1'] = "PAE1AL-NAS-03-prv.nativexintern.com"
# US-West1 NAS FQDN
default['autofs-nativex']['us-west1'] = "PAW1AL-NAS-01-prv.nativexintern.com"
# US-West2 NAS FQDN
default['autofs-nativex']['us-west2'] = "PAW2AL-NAS-02-prv.nativexintern.com"
# Default value for NAS FQDN
default['autofs-nativex']['server'] = "PAE1AL-NAS-03-prv.nativexintern.com"
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									  :key => 'TEAMFREEZE',
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/mnt/ebs'}]