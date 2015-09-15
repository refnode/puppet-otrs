# == Class otrs::httpd
#
# This class is meant to be called from otrs.
# Installs Apache webserver with all required modules for OTRS.
#
class otrs::httpd {
  
  $httpd_manage            = $::otrs::httpd_manage
  $http_secure_redirect    = $::otrs::http_secure_redirect
  $httpd_default_log_level = 'info'
  
  if $httpd_manage == true {
    
    class { 'apache':
      default_mods  => false,
      default_vhost => true,
      log_level     => $httpd_default_log_level,
      mpm_module    => 'worker',
    }
    
    include apache::mod::mime
    include apache::mod::headers
    include apache::mod::deflate
    include apache::mod::ssl
  }
}
