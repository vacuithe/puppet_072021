# Declaration de classe

#node default {
#  include role::base
#}
#
#node 'cli01.formation.lan', 'cli03.formation.lan' {
#  # appeler un role
#  include role::websrv
#}

hiera_include('classes')
