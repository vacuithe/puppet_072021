# Manifest pour déclaration de ressource

# Définition de la resource de type user

user { 'creation user test':
  ensure  => 'absent',
  name    => 'test',
  shell   => '/bin/bash',
  comment => 'User de test managé par puppet',
  groups  => 'formation',
}

# La resource groupe sera déclarée avant la ressource user (automatic ordering)
group { 'creation du groupe formation':
  ensure => 'absent',
  name   => 'formation',
  # Ordering manuel
  before => User['creation user test'],
}
