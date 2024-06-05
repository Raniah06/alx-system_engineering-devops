# 0-strace_is_your_friend.pp

exec { 'fix-permissions':
  command => '/bin/chmod -R 755 /var/www/html',
  onlyif  => '/usr/bin/find /var/www/html -type d -exec /usr/bin/test ! -perm 755 \; -print | grep .',
  notify  => Service['apache2'],
}

