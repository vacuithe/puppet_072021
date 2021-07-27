**Objectifs**

---

Dans ce travail pratique nous allons:

- se familiariser avec les ressources
- écrire un nouveau manifest
- déclarer des variables, en fonction de facts
- manipuler les conditionnals

**Prérequis**

- Doc :

    > https://puppet.com/docs/puppet/7/lang_conditional.html
    > https://puppet.com/docs/puppet/7/lang_variables.html
    > https://puppet.com/docs/puppet/7/lang_facts_accessing.html


**Exercice**

1. Déclarer une variable qui s'adapte en fonction de l'os pour le nom du package :
    - debian : ntp
    - redhat : chrony
2. Idem, le nom du service ne sera pas le même => declarer une variable qui s'adapte
    - debian : ntp
    - redhat: chronyd
3. Idem pour le fichier de config => declarer une variable qui s'adapte
    - debian : /etc/ntp.conf
    - redhat: /etc/chrony.conf
4. Idem pour le contenu de la config:

    ```puppet
    case $facts['os']['family'] {
      'Debian': {
        $ntp_line = 'logfile /var/log/ntpd3.log'
        $ntp_line_match = '^logfile'
      }
      'RedHat': {
        $ntp_line = 'logdir /var/log/'
        $ntp_line_match = '^logdir'
      }
    }
    ```
   
5. Définir une ressouce package pour installer le package

6. Utilisation ressource **file_line** pour injecter la ligne *$ntp_line* avec match *ntp_line_match*
    - Si changement => il faut déclencher le refresh d'un service

7. Ressource service qui s'assure que le service soit démarré et active avec la variable qui va bien

> Penser à l'ordonnancement (valeur littéral ou avec les flèches)

