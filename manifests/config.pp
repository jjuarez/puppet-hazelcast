##
# = class: hazelcast::config - Handles the configuration for the hazelcast process
#
class hazelcast::config inherits hazelcast {

  file { "${::halezcast::config_dir}/hazelcast.xml":
    mode    => '0640',
    content => epp("${module_name}/hazelcast.xml.epp", { }),
    require => File[$::hazelcast::install_dir],
  }
  -> file { $::hazelcast::config_dir:
    ensure => directory,
    mode   => '0640',
  }
}
