##
# The hazelcast::service class It handles the hazelcast service
#
class hazelcast::service inherits hazelcast {
  include ::systemd::systemctl::daemon_reload

  file { '/lib/systemd/system/hazelcast.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp("${module_name}/hazelcast.service.epp", { }),
  }
  ~> Class['systemd::systemctl::daemon_reload']

  service { 'hazelcast':
    ensure => $::hazelcast::service_ensure,
  }
}
