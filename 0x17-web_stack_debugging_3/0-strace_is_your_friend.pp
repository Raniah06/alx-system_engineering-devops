# 0-strace_is_your_friend.pp
# This Puppet script fixes the missing index.php file and restarts Apache

file { '/var/www/html/index.php':
  ensure  => file,
  content => '<?php echo "Hello, Holberton!"; ?>',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => File['/var/www/html/index.php'],
}

