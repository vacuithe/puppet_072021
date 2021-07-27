# Manifest demo variables, facts

# Variable type int :
$intvar = 2021

# Variable bouleen
$required = true

# Variable string
$apache_package = 'httpd'

# Ressource notify pour debuger
notify { 'Debug var package' :
  message => "Nom du package apache : ${apache_package}",
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


