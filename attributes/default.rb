# US-East NAS FQDN
default['autofs-simplyadrian']['us-east-1'] = 'PAE1AL-NAS-03.defaultdomain.com'
# US-West1 NAS FQDN
default['autofs-simplyadrian']['us-west-1'] = 'PAW1AL-NAS-01.defaultdomain.com'
# US-West2 NAS FQDN
default['autofs-simplyadrian']['us-west-2'] = 'PAW2AL-NAS-02.defaultdomain.com'
# CDC NAS FQDN
default['autofs-simplyadrian']['onpremise'] = 'NAS.defaultdomain.com'
# Default value for NAS FQDN
default['autofs-simplyadrian']['server'] = 'PAE1AL-NAS-03.defaultdomain.com'
# Mapper options
default['autofs-simplyadrian']['maps'] = [{
									  :mount_dir => '/home',
									  :key => 'defaultdomain',
									  :source => '/etc/auto.defaultdomain',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/mnt/ebs'
}]