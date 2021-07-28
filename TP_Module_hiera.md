**Objectifs**

---

Dans ce travail pratique nous allons:

- se familiariser avec les module
- se familiariser avec hiera
- mettre en pratique l'ordonnancement puppet


**Prérequis**

**Exercice**

1. Creer un nouveau module apache

    - Commande : ```pdk new module apache /etc/puppetlabs/code/environments/production/modules/apache```

2. Creer la classe principale init.pp et les classes enfants avec pdk

    - Commande : 
    ```
    $ cd /etc/puppetlabs/code/environments/production/modules/apache
    $ pdk new class apache
    $ pdk new class apache::install
    $ pdk new class apache::config
    ```

3. Coder la classe enfant install.pp

    - ressource package
    - distinction nom package :
        - Debian : apache2
        - RedHat : httpd

4. Coder la classe enfant config.pp
   
    - ressource *file* pour pousser un fichier de type template 
        - index.html.erb