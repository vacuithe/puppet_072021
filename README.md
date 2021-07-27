# Formation puppet init

## Liens docs

> https://puppet.com/docs/puppet/7/puppet_index.html

- Concept idempotence :

    > https://puppet.com/docs/pe/2019.2/understanding_idempotency.html

## Installation et config puppetserver

> https://puppet.com/docs/puppet/7/server/install_from_packages.html

- Service :
    ```bash
    $ systemctl status puppetserver
    $ systemctl restart|stop|start puppetserver
    ```

- Configuration :
    - server: **/etc/puppetlabs/puppetserver/conf.d/puppetserver.conf**
    - JVM (java): **/etc/default/puppetserver**

- Protocole réseau :
    - Port par défaut: 8140 (https) => vérif netstat -ant

- Logs puppet (technique)
    - /var/log/puppetlabs

- Utilisation puppetserver en ligne de commandes:
    - Certifications
        ```bash
        $ puppetserver --help
        $ puppetserver ca list --all
        ```
    - Signature: autosign
      > https://puppet.com/docs/puppet/7/ssl_autosign.html
    
    - Lister les certificats signés ou en attende :
        ```bash
        $ puppetserver ca list --all
        ```
    
    - Signer manuellement un certificat :

        ```bash
        $ puppetserver ca sign --certname cli01.formation.lan
        ```


## Agent 

- Installation

- Premier déclenchement : création certificat => envoie requête au puppetserver => attente signature
    ```bash
    $ puppet agent -t
    Info: Creating a new RSA SSL key for cli01.formation.lan
    Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.   yal
    Info: Creating a new SSL certificate request for cli01.formation.lan
    Info: Certificate Request fingerprint (SHA256):     64:C4:94:8F:3F:BB:AA:DF:63:7A:17:22:38:4E:7D:A3:B7:FC:E8:B8:69:31:BE:D9:12:C3:E B:42:7F:71:94:8B
    Info: Certificate for cli01.formation.lan has not been signed yet
    Couldn't fetch certificate from CA server; you might still need to sign this agent's certificate (cli01.formation.lan).
    Exiting now because the waitforcert setting is set to 0.
    ```

## Concept ressource :

### Lister les ressources dispo :

    ```bash
    $ puppet describe -l
    ```


### Transposer un objet existant en langage de déclaration puppet

- On utilise la commande puppet (dispo avec un simple agent)

    - Resource de type fichier :
    ```bash
    $ puppet resource file /etc/passwd
    ```
    ```puppet
    file { '/etc/passwd':
      ensure   => 'file',
      content  => '{sha256}4513268fb7fd97059b77940ee249514e280e435bb9a3650759a2f8729662c7b5',
      ctime    => '2021-07-26 09:15:08 +0000',
      group    => 0,
      mode     => '0644',
      mtime    => '2021-07-26 09:15:08 +0000',
      owner    => 0,
      provider => 'posix',
      type     => 'file',
    }
    ```

    - ressource de type user :
    ```bash
    $ puppet resource user vagrant
    ```
    ```puppet
    user { 'vagrant':
      ensure             => 'present',
      comment            => ',,,',
      gid                => 1000,
      home               => '/home/vagrant',
      password           => '$6$DvLErCjtTEd99/S2$jwCKZY8SIxof4A17ajy.K0dqR/      HGGqyKtgdRE1rGrsoc3SQNrO7OZXAeIXepqElDKVM8xfky4egOU8WilwcXF0',
      password_max_age   => 99999,
      password_min_age   => 0,
      password_warn_days => 7,
      provider           => 'useradd',
      shell              => '/bin/bash',
      uid                => 1000,
    }
    ```


## Code puppet 

### Ordering

- Par défaut les ressource sont exécutée dans leur ordre de définition dans le manifest.
    - /!\ : Certaines ressources peuvent lors de la compilation être ordonnancées automatiquement
    - Il est important de maîtriser cet ordonnancement :
        > https://puppet.com/docs/puppet/7/lang_relationships.html

### Variables et facts

> https://puppet.com/docs/puppet/7/lang_variables.html

> https://puppet.com/docs/puppet/7/lang_facts_accessing.html


### Conditionnals

> https://puppet.com/docs/puppet/7/lang_conditional.html