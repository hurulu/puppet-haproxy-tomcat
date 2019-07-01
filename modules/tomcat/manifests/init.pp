class tomcat {
  package { 'tomcat7':
    ensure  => installed,
  } ->
  service { 'tomcat7':
    ensure  => 'running',
  }
  
  file { "/var/lib/tomcat7/bin": 
    ensure => directory, 
  } ->
  file { "/var/lib/tomcat7/bin/setenv.sh": 
   mode   => 0755,
   content => template("tomcat/setenv.sh.erb"), 
  } ->
  file { "/var/lib/tomcat7/webapps/hello.war": 
   ensure => present,
   source => 'puppet:///modules/tomcat/hello.war', 
   notify => Service[tomcat7] 
  }

}
