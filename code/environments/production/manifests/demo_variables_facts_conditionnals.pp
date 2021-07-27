# Manifest demo variables, facts
# Class : demo vars
class demo_vars {
# Variable type int :
$intvar = 2021

# Variable bouleen
$required = false

# Variable string
#$apache_package = 'httpd'
# Selector 
$apache_package = $facts['os']['family'] ? {
  'RedHat'          => 'httpd',
  /(Debian|Ubuntu)/ => 'apache2',
}

# Ressource notify pour debuger
if $required { # Orienter le code ou la valeur des variable avec des conditions
  notify { 'Debug var package' :
    message => "Nom du package apache : ${apache_package}",
  }
}

# Fonction notice, alert => genere une output logs uniquement sur le puppetmaster
notice("Package a installer apache : ${apache_package}")
alert("Nous sommes en ${intvar}")
warning("Requis : ${required}")

# Facts - appeler un facts

notify {'call facts':
  #message => "Famille os : ${osfamily}" => obsolete
  message => "Famille os : ${facts['os']['family']}"
  #message  => $::osfamily => obsolete
}

# Hiera : utiliser une variable déclarée dans la structure HIERA

notify { 'utilisation var hiera':
  message => lookup('mavarhiera', String),
}

# Utilisation tableau hiera avec parcours des éléments
lookup('user_list', Array[String]).each | String $username | {
  notify { $username:}
}

}
