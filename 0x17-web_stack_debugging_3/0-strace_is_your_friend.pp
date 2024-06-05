# 0-strace_is_your_friend.pp
# This Puppet manifest fixes directory permissions and notifies Apache.

exec { 'fix-permissions':
  command => '/bin/chmod -R 755 /var/www/html',
  onlyif  => '/usr/bin/find /var/www/html -type d -exec /usr/bin/test ! -perm 755 \; -print | grep .',
  notify  => Service['apache2'],
}

service { 'apache2':
  ensure    => running,
  enable    => true,
  subscribe => Exec['fix-permissions'],
}

