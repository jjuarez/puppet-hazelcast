##
# = class: hazelcast::config - Handles the configuration for the hazelcast process
#
class hazelcast::config inherits hazelcast {

  File {
    owner => $::halezcast::user,
    group => $::halezcast::group,
  }

  file { $::hazelcast::config_dir:
    ensure => directory,
    mode   => '0640',
  }

  file { $::hazelcast::config_file:
    ensure  => present,
    mode    => '0750',
    content => epp("${module_name}/hazelcast.conf.epp", { }),
    require => File[$::hazelcast::config_dir],
  }

  file { $::hazelcast::xml_config_file:
    ensure  => present,
    mode    => '0640',
    content => epp("${module_name}/hazelcast.xml.epp", { }),
    require => File[$::hazelcast::config_dir],
  }
}
