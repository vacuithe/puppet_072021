# Classe avec parametres

class class_param ( String $mon_parametre = 'valeur defaut' ) {

  notify { 'Appel classe avec parametre':
    message => "Parametre passe a la classe : ${mon_parametre}"
  }
}
