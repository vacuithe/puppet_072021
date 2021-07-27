# Class: manage_ssh
class manage_ssh {
# Resource file_line => gestion de contenu de fichier
package { 'openssh-server':
  ensure => 'installed',
}
-> file_line { 'conf sshd':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitRootLogin no',
    match  => '^PermitRootLogin .*',
    #notify  => Service['gestion service ssh'],
    #require => Package['openssh-server'],
}
~> service { 'gestion service ssh':
    ensure => 'running',
    name   => 'sshd',
    enable => 'true',
    #require => Package['openssh-server'],
}

#augeas { 'conf sshd':
#    context => '/files/etc/ssh/sshd_config',
#    changes => [ 'set PermitRootLogin no',
#                 'set LogLevel DEBUG',
#               ],
#    notify  => Service['gestion service ssh'],
#    require => Package['openssh-server'],
#}
#Package['openssh-server'] -> File_line['conf sshd'] ~> Service['gestion service ssh']
}
