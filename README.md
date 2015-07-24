# Puppet monitis [![Build Status](https://travis-ci.org/visibilityspots/puppet-monitis.svg?branch=master)](https://travis-ci.org/visibilityspots/puppet-monitis)

Deploying a the monitis agent for the monitor.us service using puppet.

## Supported CentOS 6 x86

I packaged the monitis agent in an rpm package using a jenkins job (http://visibilityspots.dyndns.org:8080/job/package-monitis-agent/).

This repository is maintained on http://repository.visibilityspots.com/repoview/.

Example for node.pp manifest:

```node 'HOSTNAME' {
  yumrepo { 'visibilityspots':
    baseurl  => 'http://repository.visibilityspots.com',
    descr    => 'Visibilityspots repository',
    enabled  => 1,
    gpgcheck => 0
  }
  class {
    'monitis':
      mail      => 'THE EMAIL ADRES OF YOUR FREE MONITOR.US ACCOUNT',
      agentname => 'SPECIFIC NAME OF THE SERVER YOU WANT TO MONITOR BY MONITOR.US';
  }
}
```

Additionally you can add the api and secret key from your monitor.us account.

```puppet
 class {
    'monitis':
      mail      => 'THE EMAIL ADRES OF YOUR MONITOR.US ACCOUNT',
      apikey    => 'THE APIKEY PROVIDED BY MONITOR.US (SETTINGS ON MONITOR.US)',
      secretkey => 'THE SECRETKEY PROVIDED BY MONITOR.US (SETTINGS ON MONITOR.US)',
      agentname => 'SPECIFIC NAME OF THE SERVER YOU WANT TO MONITOR';
 }
```

By default those parameters are used.

```puppet
  $pkg_name     = 'monitis-agent'
  $conffile     = '/etc/monitis/etc/monitis.conf'
  $homedir      = '/etc/monitis'
  $logfile      = '/etc/monitis/logs/monitis.log'
  $loglev       = '5'
  $pidfile      = '/etc/monitis/logs/monitis.pid'
  $useremail    = undef
  $agentname    = undef
  $usehost      = 'https://174.37.16.80:443/fcgi-bin/agentgateway'
  $apikey       = undef
  $secretkey    = undef
  $motd         = false
```

Feel free to report issue's or comments.
