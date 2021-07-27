# TP vars, facts, conditionnals
# Class : manage_ntp
class manage_ntp {

# Variable nom package ntp
$ntp_package = $facts['os']['family'] ? {
  'Debian' => 'ntp',
  'RedHat' => 'chrony',
}

case $facts['os']['family'] {
  'Debian': {
    $ntp_line = 'logfile /var/log/ntpd3.log'
    $ntp_line_match = '^logfile'
    $ntp_service = 'ntp'
    $ntp_config_file = '/etc/ntp.conf'
  }
  'RedHat': {
    $ntp_line = 'logdir /var/log/'
    $ntp_line_match = '^logdir'
    $ntp_service = 'chronyd'
    $ntp_config_file = '/etc/chrony.conf'
  }
}

# Ressource package 
package { $ntp_package:
  ensure => 'installed',
}
-> file_line { 'conf ntp':
    path  => $ntp_config_file,
    line  => $ntp_line,
    match => $ntp_line_match,
}
~> service { $ntp_service:
    ensure => running,
    enable => true,
}
}
