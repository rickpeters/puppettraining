# class for implementing apache
class apache2 {
  exec { 'apt-get update':
    path => '/usr/bin',
  }

  package { 'apache2':
    ensure  => present,
    require => Exec['apt-get update'],
  }

  service { 'apache2':
    ensure  => 'running',
    require => Package['apache2'],
  }

  file { '/var/www/sample-webapp':
    ensure  => 'link',
    target  => '/vagrant/sample-webapp',
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

  file { 'httpd-conf':
    ensure  => 'file',
    path    => '/etc/apache2/httpd.conf',
    source  => 'puppet:///modules/apache2/httpd.conf',
    require => Package['apache2'],
    notify  => Service['apache2'],
  }
}
