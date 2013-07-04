# baseclass for installing tomcat6 Application Server
class tomcat6 {
  package { 'tomcat6':
    ensure  => present,
    require => Exec['apt-get update'],
  }

  # configureer de standaard users en rechten inclusief een manager rol
  file { '/var/lib/tomcat6/conf/tomcat-users.xml':
    #source  => '/vagrant/manifests/config/tomcat-users.xml',
    source  => 'puppet:///modules/tomcat6/tomcat-users.xml',
    owner   => root,
    group   => tomcat6,
    mode    => 'u=rwg=rw',
    #mode    => '0640',
    # tomcat moet worden herstart als de file wordt aangepast
    notify  => Service['tomcat6'],
    require => Package['tomcat6']
  }

  package { 'tomcat6-docs':
    ensure  => present,
    require => Package['tomcat6'],
  }

  package { 'tomcat6-examples':
    ensure  => present,
    require => Package['tomcat6'],
  }

  package { 'tomcat6-admin':
    ensure  => present,
    require => Package['tomcat6'],
  }

  service { 'tomcat6':
    ensure  => 'running',
    require => Package['tomcat6'],
  }
}
