exec { "apt-get update":
  path => "/usr/bin",
}

package { "apache2":
  ensure  => present,
  require => Exec["apt-get update"],
}

service { "apache2":
  ensure  => "running",
  require => Package["apache2"],
}

file { "/var/www/sample-webapp":
  ensure  => "link",
  target  => "/vagrant/sample-webapp",
  require => Package["apache2"],
  notify  => Service["apache2"],
} 

package { "tomcat6":
  ensure  => present,
  require => Exec["apt-get update"],
}

# configureer de standaard users en rechten inclusief een manager rol
file { '/var/lib/tomcat6/conf/tomcat-users.xml':
  source  => '/vagrant/manifests/config/tomcat-users.xml',
  owner   => root,
  group   => tomcat6,
  mode    => 640,
  notify  => Service['tomcat6'], # tomcat wordt herstart als de file wordt aangepast
  require => Package["tomcat6"]
}

package { "tomcat6-docs":
  ensure  => present,
  require => Package["tomcat6"],
}

package { "tomcat6-examples":
  ensure  => present,
  require => Package["tomcat6"],
}

package { "tomcat6-admin":
  ensure  => present,
  require => Package["tomcat6"],
}

service { "tomcat6":
  ensure  => "running",
  require => Package["tomcat6"],
}

