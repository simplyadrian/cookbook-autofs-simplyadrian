# US-East NAS FQDN
default['autofs-nativex']['us-east-1'] = 'PAE1AL-NAS-03.teamfreeze.com'
# US-West1 NAS FQDN
default['autofs-nativex']['us-west-1'] = 'PAW1AL-NAS-01.teamfreeze.com'
# US-West2 NAS FQDN
default['autofs-nativex']['us-west-2'] = 'PAW2AL-NAS-02.teamfreeze.com'
# CDC NAS FQDN
default['autofs-nativex']['cdc'] = 'NAS.teamfreeze.com'
# Default value for NAS FQDN
default['autofs-nativex']['server'] = 'PAE1AL-NAS-03.teamfreeze.com'
# Mapper options
default['autofs-nativex']['maps'] = [{
									  :mount_dir => '/home',
									  :key => 'TEAMFREEZE',
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/mnt/ebs'
}]