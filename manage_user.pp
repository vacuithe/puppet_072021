# Manifest pour déclaration de ressource

# Définition de la resource de type user

user { 'creation user test':
  ensure  => 'present',
  name    => 'test',
  shell   => '/bin/bash',
  comment => 'User de test managé par puppet',
}

