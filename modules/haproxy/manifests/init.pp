class haproxy {
  package { 'haproxy':
    ensure  => installed,
  } ->
  service { 'haproxy':
    ensure  => 'running',
  }
  file { "/etc/ssl/haproxy.pem": 
   source => 'puppet:///modules/haproxy/haproxy.pem',
  } ->
  file { "/etc/haproxy/haproxy.cfg": 
   content => template("haproxy/haproxy.cfg.erb"), 
   notify => Service[haproxy] 
  }
}
