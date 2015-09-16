# == Class otrs::params
#
# This class is meant to be called from otrs.
# It sets variables according to platform.
#
class otrs::params {
  
  $repository_manage = true
  $dbserver_manage   = true
  $httpd_manage      = true
  
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'otrs'
      $service_name = 'otrs'
      $otrs_home    = '/opt/otrs'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  
  $options_defaults  = {
    otrs_home                  => $otrs_home,
    otrs_user                  => 'otrs',
    otrs_group                 => 'apache',
  }
}
