# US-East NAS FQDN
default['autofs-nativex']['us-east1'] = "PAE1AL-NAS-03.teamfreeze.com"
# US-West1 NAS FQDN
default['autofs-nativex']['us-west1'] = "PAW1AL-NAS-01.teamfreeze.com"
# US-West2 NAS FQDN
default['autofs-nativex']['us-west2'] = "PAW2AL-NAS-02.teamfreeze.com"
# CDC NAS FQDN
defaultnode['autofs-nativex']['cdc'] = "NAS.teamfreeze.com"
# Default value for NAS FQDN
default['autofs-nativex']['server'] = "PAE1AL-NAS-03.teamfreeze.com"
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									  :key => 'TEAMFREEZE',
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/mnt/ebs'}]