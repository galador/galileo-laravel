class postgresql {
	# Install PostgreSQL 9.3 server from the PGDG repository
	class {'postgresql::globals':
	  version => '9.3',
	  manage_package_repo => true,
	  encoding => 'UTF8',
	  locale  => 'en_US.utf8',
	}->
	class { 'postgresql::server':
	  ensure => 'present',
	  listen_addresses => '*',
	  manage_firewall => true,
	}

	# Install contrib modules
	class { 'postgresql::server::contrib':
	  package_ensure => 'present',
	}
}