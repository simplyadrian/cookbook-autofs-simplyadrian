actions :enable, :disable

attribute :name, kind_of: String, name_attribute: true

attribute :mount_point, kind_of: String
attribute :device, kind_of: String, required: true
attribute :device_type, kind_of: Symbol, equal_to: [:device, :label, :uuid], default: :device
attribute :fstype, kind_of: String, required: true
attribute :options, kind_of: [Array, String], default: 'defaults'

def initialize(name, run_context = nil)
  super
  @mount_point = name
  @action = :enable
end