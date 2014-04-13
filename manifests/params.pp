# == Class statsd::params
class statsd::params {
  $ensure                       = 'present'
  $node_module_dir              = '/usr/lib/node_modules'

  $port                         = '8125'
  $address                      = '0.0.0.0'

  $graphiteHost                 = 'localhost'
  $graphitePort                 = '2003'

  $backends                     = [ './backends/graphite' ]
  $debug                        = false
  $mgmt_address                 = '0.0.0.0'
  $mgmt_port                    = '8126'
  $statsd_title                 = 'statsd'
  $healthStatus                 = 'up'
  $dumpMessages                 = false
  $flushInterval                = '10000'
  $percentThreshold             = ['90']
  $flush_counts                 = true

  $influxdb_host                = ''
  $influxdb_port                = '8086'
  $influxdb_database            = 'statsd'
  $influxdb_username            = 'root'
  $influxdb_password            = 'root'
  $influxdb_flush               = true
  $influxdb_proxy               = false
  $influxdb_proxy_suffix        = 'raw'
  $influxdb_proxy_flushInterval = '10000'

  $librato_email                = ''
  $librato_token                = ''
  $librato_snapTime             = '10000'
  $librato_countersAsGauges     = true
  $librato_skipInternalMetrics  = true
  $librato_retryDelaySecs       = '5'
  $librato_postTimeoutSecs      = '4'

  $config                       = { }

  case $::osfamily {
    'RedHat', 'Amazon': {
      $init_script = 'puppet:///modules/statsd/statsd-init-rhel'
    }
    'Debian': {
      $init_script = 'puppet:///modules/statsd/statsd-init'
    }
    default: {
      fail('Unsupported OS Family')
    }
  }
}
