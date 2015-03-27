# Default value for NAS FQDN
default['autofs-nativex']['server'] = "PAE1AL-NAS-03-prv.nativexintern.com"
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									  :key => 'TEAMFREEZE'
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/mnt/ebs'}]