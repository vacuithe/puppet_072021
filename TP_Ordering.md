**Objectifs**

---

Dans ce travail pratique nous allons:

- se familiariser avec les ressources
- écrire un nouveau manifest
- mettre en pratique l'ordonnancement puppet

**Prérequis**

- Doc :

  - Ressource **package** : https://puppet.com/docs/puppet/7/types/package.html

  - Ressource **service** : https://puppet.com/docs/puppet/7/types/service.html
  Ressource **augeas** : https://forge.puppet.com/modules/puppetlabs/augeas_core

  - relationships : https://puppet.com/docs/puppet/7/lang_relationships.html

---

## Exercice 1: Créer le manifest manage_ssh.pp dans code/environments/production/manifests


1. Créer une ressource de type package pour s'assurer que le package openssh-server soit installé sur les agent


2. Créer une ressource de type augeas pour manager le fichier de config ssh server

   - /etc/ssh/sshd_config
   - Changement : 'set PermitRootLogin no'
   - Cette ressource doit être ordonnancé pour être appliquée après la ressource package
   - Cette ressource doit déclencher l'appel de la ressource de type service pour redémarrer ssh si changement


3. Créer une ressource de type service pour gerer le service ssh

  - name: sshd
  - ensure: running