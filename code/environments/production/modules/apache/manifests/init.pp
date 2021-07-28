# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache (
  $config_apache = true,
)
{
  include apache::install
  if $config_apache {
    include apache::config
  }
}
