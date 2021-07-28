# Classe : manage_tz
class system::manage_tz (
  $timezone )
{
  exec { 'Mise à jour de la timezone':
    path    => [ '/usr/bin', '/usr/sbin', '/bin' ],
    command => "timedatectl set-timezone ${timezone}",
    unless  =>  "timedatectl | grep 'Time zone' | grep ${timezone}",
  }
  notify { $system::manage_tz::timezone:
  }
}
