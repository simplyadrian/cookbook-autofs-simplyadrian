# mapper options
default.autofs[:maps] = [{:mount_dir => '/home',
						  :key => 'TEAMFREEZE'
						  :source => '/etc/auto.TEAMFREEZE',
						  :options => '-rw,intr,rsize=8192,wsize=8192',
						  :server => 'PAW1AL-NAS-01-prv.nativexintern.com',
						  :export => '/mnt/ebs'}]