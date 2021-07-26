# TP Ressources

**Contexte**

---

La ressource est le concept clé de puppet. Elle représente de manière abstraite tout objet concret géré sur la machine.

---

**Objectifs**

---

Dans ce travail pratique nous allons:

- nous familiariser avec la commande puppet
- découvrir la sous-commande puppet resource
- mettre en pratique nos connaissances de base de la syntaxe puppet
- écrire notre premier manifest
- compiler et appliquer notre premier catalogue

**Prérequis**

- être connecté sur votre VM

---

## Exercice 1: découverte des ressources puppet
Nous allons utiliser la commande puppet resource afin de comprendre la correspondance entre le code puppet et l'état de la machine.

1. Taper la commande puppet help et prendre connaissance de la sortie

    ```bash
    $ puppet help
    ```
2. Taper la commande puppet help resource

    ``bash
    $ puppet resource help
    ```

3. Utiliser la commande adéquate pour lister les types de ressources disponibles

    ```bash
    $ puppet describe --list
    ```

4. Utiliser la commande puppet pour représenter la ressource de type user du user root présent su la machine 

    ```bash
    $ puppet resource user root
    ```

5. Utiliser la commande puppet pour représenter la ressource de type service du service sshd présent su la machine 

    ```bash
    $ puppet resource service sshd
    ```

---

## Exercice 2: Ecriture d'un manifest

1. Ecrire la définition d'une resource user dans un fichier manifest : manage_user.pp
   - Name : test
   - Ensure: present
   - Shell : /bin/bash
   - Gecos (commentaire) : "user de test manage par puppet"

   > On peut regarde la doc pour la ressource user : https://puppet.com/docs/puppet/7/types/user.html

2. Appliquer le manifest localement (stadalone)

    ```bash
    $ puppet apply /vagrant/manage_user.pp
    ```

3. Modifier le manifest pour ajouter l'attribut group au user test et réappliquer le manifest

   ```puppet
   groups => 'formation'
   ```

4. Ajouter à la suite du code (après la resource user), une resource de type group pour demander la présence du group **formation** sur la machine, et réappliquer le manifest

    > https://puppet.com/docs/puppet/7/types/group.html

    ```puppet
      user { 'test':
        ensure     => 'present',
        comment    => 'user de test manage par puppet',
        shell      => '/bin/bash',
        managehome => 'true',
        groups     => 'formation',
      }
      
      group { 'formation':
        ensure => 'present',
      }
      ```
