# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::install
class apache::install (
  $apache_package,
  $apache_service,
) {

  # fonction ensure_package pour installer le packege
  ensure_packages([$apache_package], {'ensure' => 'present'})


  service { $apache_service :
      ensure  => running,
      enable  => true,
      require => ensure_packages([$apache_package]),
    }

}
