autofs-nativex Cookbook
=======================
This cookbook provides the ability install and configure the autofs service and ayutomount mappings. As well as two recipes that setup the current autofs usage at NativeX for AWS and CDC.

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
    <td><tt>['autofs-nativex']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### autofs-nativex::default

Just include `autofs-nativex` in your node's `run_list` to create auto.master entry for auto mounting home directories:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[autofs-nativex]"
  ]
}
```

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
