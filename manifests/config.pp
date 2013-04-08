# Class: monitis::config
#
# Class which configures the monitis agent service
class monitis::config {
  file { $::monitis::conffile :
    owner        => 'root',
    group        => 'root',
    replace      => true,
    content      => template('monitis/monitis.conf.erb'),
    refresh_only => true,
    notify       => Exec['restart monitis'];
  }

  exec { 'restart monitis':
    subscribe       => File[ $::monitis::conffile ],
    command         => '/etc/monitis/monitis.sh restart',
    refreshonly     => true
  }
}
