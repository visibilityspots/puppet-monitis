# Class: monitis::config
#
# Class which configures the monitis agent service
class monitis::config {
  file { $::monitis::conffile :
    owner   => 'root',
    group   => 'root',
    replace => true,
    content => template('monitis/monitis.conf.erb'),
  }

  exec { 'restart monitis':
    subscribe       => File[ $::monitis::conffile ],
    command         => '/etc/monitis/monitis.sh restart',
    refreshonly     => true
  }
}
