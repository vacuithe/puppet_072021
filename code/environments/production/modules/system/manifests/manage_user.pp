# Manifest pour déclaration de ressource
# Class :manage_user
class system::manage_user {
# Définition de la resource de type user
# Modification du code pour utilisation d'une variable hiera et parcours de la liste
lookup('user_list', Array[String]).each | String $username | {
  user { $username:
    ensure  => 'present',
    shell   => '/bin/bash',
    comment => 'User de test managé par puppet',
    groups  => 'formation',
  }
}

# La resource groupe sera déclarée avant la ressource user (automatic ordering)
group { 'creation du groupe formation':
  ensure => 'present',
  name   => 'formation',
  # Ordering manuel
  #before => User['$username'],
}
}


