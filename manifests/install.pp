# Class: monitis::install
#
# Installation of the monitis package
class monitis::install {
  package { $monitis::pkg_name :
    ensure  => 'latest'
  }
}
