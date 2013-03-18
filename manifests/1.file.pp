# /vagrant/manifests/1.file.pp
file {'testfile':
  path     => '/tmp/testfile',
  ensure   => present,
  mode     => 0640,
  owner    => root,
  group    => root,
  content  => "I'm a test file.",
}
