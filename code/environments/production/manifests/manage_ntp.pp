# TP vars, facts, conditionnals

# Variable nom package ntp
$ntp_package = $facts['os']['family'] ? {
  'Debian' => 'ntp',
  'RedHat' => 'chrony',
}

$ntp_service = $facts['os']['family'] ? {
  'Debian' => 'ntp',
  'RedHat' => 'chronyd',
}

$ntp_config_file = $facts['os']['family'] ? {
  'Debian' => '/etc/ntp.conf',
  'RedHat' => '/etc/chrony.conf',
}

case $facts['os']['family'] {
  'Debian': {
    $ntp_line = 'logfile /var/log/ntpd3.log'
    $ntp_line_match = '^logfile'
  }
  'RedHat': {
    $ntp_line = 'logdir /var/log/'
    $ntp_line_match = '^logdir'
  }
}

# Ressource package 
package { $ntp_package:
  ensure => 'installed',
}
-> file_line { 'conf ntp':
    path    => $ntp_config_file,
    line    => $ntp_line,
    match   => $ntp_line_match,
}
~> service { $ntp_service:
    ensure => running,
    enable => true,
}
