# Class: monitis::service
#
# Class which serviceures the monitis agent service
class monitis::service {
  service { 'monitis':
    ensure     => 'running',
    hasrestart => true,
    restart    => "${monitis::homedir}/monitis.sh restart",
    start      => "${monitis::homedir}/monitis.sh start",
    status     => "${monitis::homedir}/monitis.sh status",
    stop       => "${monitis::homedir}/monitis.sh stop";
  }
}
