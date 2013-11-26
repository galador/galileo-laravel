class mysql 
{
    $password = 'vagrant'

	exec { 'updateapt-mysql': 
	    command => '/usr/bin/apt-get update'
	}

    package
    {
        "php5-mysql":
            ensure => present,
			require => Exec['updateapt-mysql']
    }

    package 
    { 
        "mysql-server":
            ensure  => present,
            require => [ Package['php5-mysql'], Exec['updateapt-mysql'] ]
    }

    service 
    { 
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
    }

    exec 
    { 
        "Set MySQL server root password":
            subscribe => [ Package["mysql-server"] ],
            refreshonly => true,
            unless => "mysqladmin -uroot -p$password status",
            path => "/bin:/usr/bin",
            command => "mysqladmin -uroot password $password",
      }
}
