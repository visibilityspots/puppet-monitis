# Class monitis::params
#
# This class contains every parameter which will be used in this puppet module
# for setting up the monitis agent
class monitis::params {
  $pkg_name     = 'monitis-agent'
  $conffile     = '/etc/monitis/etc/monitis.conf'
  $homedir      = '/etc/monitis'
  $logfile      = '/etc/monitis/logs/monitis.log'
  $pidfile      = '/etc/monitis/logs/monitis.pid'
  $useremail    = undef
  $agentname    = undef
  $usehost      = 'https://174.37.16.80:443/fcgi-bin/agentgateway'
  $motd         = false
}
