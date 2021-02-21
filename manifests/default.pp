class { 'apache':
  default_vhost => false,
  }
  apache::vhost { 'tyler.com':
    servername	=> 'tyler',
    port		=> '8080',
	docroot		=> '/var/www/html',
  } 
  file { 'hello_world.html':
    path	=> '/var/www/html/index.html',
	content	=> '<html><body><h1>Hello World!</h1></body></html>',
	}