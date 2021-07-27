# Declaration de classe

node default {
  include manage_user
  include manage_ntp
  include manage_ssh
}

node 'cli01.formation.lan' {
  include demo_vars
  include manage_user
  include manage_ntp
  include manage_ssh
}
