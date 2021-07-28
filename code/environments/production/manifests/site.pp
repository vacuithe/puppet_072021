# Declaration de classe

#node default {
#  include role::base
#}
#
#node 'cli01.formation.lan', 'cli03.formation.lan' {
#  # appeler un role
#  include role::websrv
#}

# Classification via hiera yaml 
hiera_include('classes')

# Classification via custom facts role
#include "role::${facts['role']}"

# Classification original
#node 'cli01.formation.lan', 'cli03.formation.lan' {
#  # appeler un role
#  include role::websrv
#}
