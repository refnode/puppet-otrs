# == Class otrs::dbserver
#
# This class is called from otrs for dbserver setup.
#
class otrs::dbserver {
  
  $dbserver_manage = $otrs::dbserver_manage
  
  if $dbserver_manage == true {
    class { 'postgresql::server':
      ip_mask_deny_postgres_user => '0.0.0.0/32',
      ip_mask_allow_all_users    => '0.0.0.0/0',
      listen_addresses           => '*',
    }
  }
}
