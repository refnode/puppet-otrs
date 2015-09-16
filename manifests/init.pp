# == Class: otrs
#
# Full description of class otrs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class otrs (
  
  $repository_manage = $::otrs::params::repository_manage,
  $dbserver_manage   = $::otrs::params::dbserver_manage,
  $httpd_manage      = $::otrs::params::httpd_manage,
  $package_name      = $::otrs::params::package_name,
  $service_name      = $::otrs::params::service_name,
  $options_hash      = {},

) inherits ::otrs::params {

  $options = merge($otrs::params::options_defaults, $options_hash)
  
  class { '::otrs::repository': } ->
  class { '::otrs::dbserver': } ->
  class { '::otrs::httpd': } ->
  class { '::otrs::install': } ->
  class { '::otrs::config': } ~>
  class { '::otrs::service': } ->
  Class['::otrs']
}