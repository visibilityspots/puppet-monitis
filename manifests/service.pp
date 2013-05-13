# Class: monitis::service
#
# Class which serviceures the monitis agent service
class monitis::service {
  service { 'monitis':
    ensure     => 'running',
    hasrestart => true,
    restart    => '/etc/monitis/monitis.sh restart',
    start      => '/etc/monitis/monitis.sh start',
    status     => '/etc/monitis/monitis.sh status',
    stop       => '/etc/monitis/monitis.sh stop';
  }
}
