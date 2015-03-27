#Dynamic NAS FQDN
default['autofs-nativex']['server'] = 'PAW1AL-NAS-01-prv.nativexintern.com'
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									   :key => 'TEAMFREEZE'
									   :source => '/etc/auto.TEAMFREEZE',
									   :options => '-rw,intr,rsize=8192,wsize=8192',
									   :export => '/mnt/ebs'}]