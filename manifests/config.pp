# == Class otrs::config
#
# This class is called from otrs for service config.
#
class otrs::config {

  $configfile = 'Kernel/Config.pm'
  
  $options           = $otrs::options
  $otrs_home         = $options[otrs_home]
  
  concat { $configfile:
    ensure => present,
    path   => "${otrs_home}/Kernel/Config.pm",
    owner  => $options[otrs_user],
    group  => $options[otrs_group],
    mode   => '0640',
    order  => 'numeric',
  }
  
  concat::fragment { 'config_start':
    target  => $configfile,
    order   => 0,
    content => template('otrs/config/_config_start.erb'),
  }
  
  concat::fragment { 'config_end':
    target  => $configfile,
    order   => 999,
    content => template('otrs/config/_config_end.erb'),
  }
}
