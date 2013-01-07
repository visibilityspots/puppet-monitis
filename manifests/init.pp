# Class: monitis
#
# Initialization class for the monitis agent
class monitis (
  $pkg_name     = $monitis::params::pkg_name,
  $homedir      = $monitis::params::homedir,
  $logfile      = $monitis::params::logfile,
  $pidfile      = $monitis::params::pidfile,
  $mail         = $monitis::params::useremail,
  $agentname    = $monitis::params::agentname,
  $usehost      = $monitis::params::usehost,
  $motd         = $monitis::params::motd,
) inherits monitis::params {

  if $motd {
    motd::register{'monitis':}
  }

  include ::monitis::install
  include ::monitis::config

  Class['::monitis::install'] ->
  Class['::monitis::config']
}
