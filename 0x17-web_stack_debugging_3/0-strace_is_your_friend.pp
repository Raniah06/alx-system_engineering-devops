# 0-strace_is_your_friend.pp
# This Puppet manifest fixes a typo in wp-settings.php

exec { 'fix-apache2.0':
  command => "sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

