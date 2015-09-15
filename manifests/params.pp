# == Class otrs::params
#
# This class is meant to be called from otrs.
# It sets variables according to platform.
#
class otrs::params {
  
  $repository_manage = true
  $dbserver_manage   = true
  
  case $::osfamily {
    'Debian': {
      $package_name = 'otrs'
      $service_name = 'otrs'
    }
    'RedHat', 'Amazon': {
      $package_name = 'otrs'
      $service_name = 'otrs'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
