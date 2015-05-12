autofs-simplyadrian Cookbook
=======================
This cookbook provides the ability install and configure the autofs service and automount mappings.

Requirements
------------

#### cookbooks
- `ohai-simplyadrian` - only for EC2 deployments when using the `dynamic_nas` recipe.
- `chef-sugar` - to detect if server is running in EC2.

* Chef 11 or higher

#### Supported OS Distributions
Tested on:

* * CentOS 6.5 & 6.6

Attributes
----------

#### autofs-simplyadrian::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['autofs-simplyadrian']['us-east1']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-east1 regions default NAS server</td>
    <td><tt>PAE1AL-NAS-03.defaultdomain.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-simplyadrian']['us-west1']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-west1 regions default NAS server</td>
    <td><tt>PAW1AL-NAS-01.defaultdomain.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-simplyadrian']['us-west2']</tt></td>
    <td>String</td>
    <td>The FQDN of the us-west2 regions default NAS server</td>
    <td><tt>PAW2AL-NAS-02.defaultdomain.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-simplyadrian']['server']</tt></td>
    <td>String</td>
    <td>The default FQDN of the NAS server. This value will be used if ohai can't determine the region of a server.</td>
    <td><tt>PAE1AL-NAS-03.defaultdomain.com</tt></td>
  </tr>
  <tr>
    <td><tt>['autofs-simplyadrian']['maps']</tt></td>
    <td>Array</td>
    <td>The array of values that defines automount mapper files name and contents.</td>
    <td><tt>[{:mount_dir => '/home',
                    :key => 'defaultdomain',
                    :source => '/etc/auto.defaultdomain',
                    :options => '-rw,intr,rsize=8192,wsize=8192',
                    :export => '/mnt/ebs'}]</tt></td>
  </tr>
</table>

Usage
-----
#### autofs-simplyadrian::default

Just include `autofs-simplyadrian` in your node's `run_list` to create auto.master and auto.defaultdomain mapper files for auto
mounting home directories:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[autofs-simplyadrian]"
  ]
}
```

TODO
----
#### autofs-simplyadrian::automount_ds

Include `autofs-simplyadrian::automount_ds` in your node's `run_list` to create auto.master entry for auto mounting datascience
NAS directories:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[autofs-simplyadrian::automount_ds]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera (<simplyadrian@gmail.com>), Jesse Hauf
