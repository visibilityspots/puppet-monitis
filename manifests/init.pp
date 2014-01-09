# Class: monitis
#
# Initialization class for the monitis.us agent
class monitis (
  $pkg_name     = $monitis::params::pkg_name,
  $homedir      = $monitis::params::homedir,
  $logfile      = $monitis::params::logfile,
  $loglev       = $monitis::params::loglev,
  $pidfile      = $monitis::params::pidfile,
  $mail         = $monitis::params::useremail,
  $agentname    = $monitis::params::agentname,
  $usehost      = $monitis::params::usehost,
  $apikey       = $monitis::params::apikey,
  $secretkey    = $monitis::params::secretkey,
  $motd         = $monitis::params::motd,
) inherits monitis::params {

  if $motd {
    motd::register{'monitis':}
  }

  include monitis::install
  include monitis::config
  include monitis::service

  Class['monitis::install'] ->
  Class['monitis::config'] ->
  Class['monitis::service']
}
