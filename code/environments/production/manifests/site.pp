# Declaration de classe

node default {
  include system
  class { 'class_param':
    mon_parametre => 'common param'
  }
}

node 'cli01.formation.lan' {
  #class { 'class_param':
  #  mon_parametre => 'custom param00'
  #}
  #class { 'manage_tz':
  #  timezone => 'Europe/Madrid'
  #}
  demo_define {'Instance bdd01':}
  demo_define {'Instance bdd02':}
  include system
  include apache
}

node 'cli02.formation.lan' {
  include stdlib
  include test
  include system
  include apache
}
