# 0-strace_is_your_friend.pp
# This Puppet manifest ensures the PHP module is enabled and Apache is restarted

package { 'libapache2-mod-php5':
  ensure => installed,
}

exec { 'enable-php-module':
  command => '/usr/sbin/a2enmod php5',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  unless  => '/usr/sbin/apache2ctl -M | grep php5',
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [Package['libapache2-mod-php5'], Exec['enable-php-module']],
}

