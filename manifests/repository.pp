# == Class otrs::repository
#
# This class is meant to be called from otrs.
# Prepares third party package repository.
#
class otrs::repository {
  
  $repository_manage      = $::otrs::repository_manage
  
  if $repository_manage == true {
    yumrepo { 'wiredobjects-archive-otrs':
      descr    => 'wiredobjects third party repository for OTRS',
      baseurl  => 'http://archive.wiredobjects.io/centos/7/otrs/x86_64/',
      enabled  => true,
      gpgcheck => 0,
    }
  }
}
