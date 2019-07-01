
# This code fragment will install the tomcat package from EPEL and start the service
#

node 'some-node.ap-northeast-1.compute.internal' {
  class { 'tomcat': } 
  class { 'haproxy': }
}
