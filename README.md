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
    - Port par défaut: 8140 (https)