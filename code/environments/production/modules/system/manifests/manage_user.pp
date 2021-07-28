# Manifest pour déclaration de ressource
# Class :manage_user
class system::manage_user (
  $user_list,
  $user_list_default,
)
{
# Définition de la resource de type user
# Modification du code pour utilisation d'une variable hiera et parcours de la liste
#lookup('system::manage_user::user_list', Hash, 'hash').each | String $username, Hash $attrs| {
#  user { $username:
#    *      => $attrs,
#    groups => 'formation',
#  }
#}
# Utilisation d'une fonction create_ressource pour gérer le hash 
create_resources(user, $user_list, $user_list_default)

# La resource groupe sera déclarée avant la ressource user (automatic ordering)
group { 'creation du groupe formation':
  ensure => 'present',
  name   => 'formation',
  # Ordering manuel
  #before => User['$username'],
}
}


