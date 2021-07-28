# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::config
class apache::config (
  $apache_index_path = undef,
)
{

  # Ajout d'un condition
  if $facts['os']['family'] == 'RedHat' {
  # Pousser un fichier static
  # Utilisation de la ressource file
    file { 'pousser un fichier statique':
      path   => $apache_index_path,
      source => 'puppet:///modules/apache/html/staticfile.html',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  } else {
    notify { "Config pas encore implémenté pour : ${facts['os']['family']}":
    }
  }
  # Pousser un fichier dynamic (template)
}
