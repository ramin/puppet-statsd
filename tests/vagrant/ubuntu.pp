class { 'nodejs':
  node_pkg             => 'nodejs010',
  npm_pkg              => 'nodejs010-npm',
  dev_pkg              => 'nodejs010-devel',
  dev_package          => true,
}->
#class { 'nodejs': manage_repo => true }->
# http://blog.npmjs.org/post/78085451721/npms-self-signed-certificate-is-no-more
exec { '/usr/bin/npm config set ca=""': }->
class { 'statsd':
  backends              => [ './backends/graphite', 'statsd-influxdb-backend', 'statsd-librato-backend', 'stackdriver-statsd-backend'],
  graphite_globalSuffix => 'foobar',
  influxdb_host         => 'localhost',
  librato_email         => 'foo@bar.com',
  librato_token         => 'secret_token',
  stackdriver_apiKey    => 'foobar'
}
