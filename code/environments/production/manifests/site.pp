# Declaration de classe

node default {
  include manage_user
  include manage_ntp
  include manage_ssh
  include manage_tz

  class { 'class_param':
    mon_parametre => 'common param'
  }
}

node 'cli01.formation.lan' {
  class { 'class_param':
    mon_parametre => 'custom param00'
  }
  class { 'manage_tz':
    timezone => 'Europe/Madrid'
  }
  demo_define {'Instance bdd01':}
  demo_define {'Instance bdd02':}
  include system
}
