# Declaration de classe

node default {
  include manage_user
  include manage_ntp
  include manage_ssh
  class { 'class_param':
    mon_parametre => 'common param'
  }
}

node 'cli01.formation.lan' {
  #include demo_vars
  #include manage_user
  #include manage_ntp
  #include manage_ssh
  #include class_param
  class { 'class_param':
    mon_parametre => 'custom param00'
  }
  class { 'manage_tz':
    timezone => 'Europe/Madrid'
  }
}
