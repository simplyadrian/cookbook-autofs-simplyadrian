autofs-nativex Cookbook
=======================
This cookbook provides the ability install and configure the autofs service and automount mappings.

Requirements
------------

#### cookbooks
- `ohai-nativex` - only for EC2 deployments when using the `dynamic_nas` recipe.

* Chef 11 or higher

#### Supported OS Distributions
Tested on:

* * CentOS 6.5 & 6.6

Attributes
----------

#### autofs-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['autofs-nativex']['us-east1']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-east1 regions default NAS server</td>
    <td><tt>PAE1AL-NAS-03-prv.nativexintern.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-nativex']['us-west1']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-west1 regions default NAS server</td>
    <td><tt>PAW1AL-NAS-01-prv.nativexintern.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-nativex']['us-west2']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-west2 regions default NAS server</td>
    <td><tt>PAW2AL-NAS-02-prv.nativexintern.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-nativex']['server']</tt></td>
    <td>String</td>
    <td>The default FQDN of the NAS server. This value will be used if ohai can't determine the region of a server.</td>
    <td><tt>PAE1AL-NAS-03-prv.nativexintern.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-nativex']['maps']</tt></td>
    <td>Array</td>
    <td>The array of values that defines automount mapper files name and contents.</td>
    <td><tt>[{:mount_dir => '/home',
                    :key => 'TEAMFREEZE',
                    :source => '/etc/auto.TEAMFREEZE',
                    :options => '-rw,intr,rsize=8192,wsize=8192',
                    :export => '/mnt/ebs'}]</tt></td>
  </tr>
</table>

Usage
-----
#### autofs-nativex::default

Just include `autofs-nativex` in your node's `run_list` to create auto.master and auto.TEAMFREEZE mapper files for auto mounting home directories:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[autofs-nativex]"
  ]
}
```

TODO
----

#### autofs-nativex::automount_ds

Include `autofs-nativex::automount_ds` in your node's `run_list` to create auto.master entry for auto mounting datascience NAS directories:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[autofs-nativex::automount_ds]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera (<simplyadrian@gmail.com>)
