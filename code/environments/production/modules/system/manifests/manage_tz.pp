# Classe : manage_tz
class manage_tz (
  String $timezone = 'Europe/Paris' )
{
  exec { 'Mise à jour de la timezone':
    path    => [ '/usr/bin', '/usr/sbin', '/bin' ],
    command => "timedatectl set-timezone ${timezone}",
    unless  =>  "timedatectl | grep 'Time zone' | grep ${timezone}",
  }
}
