class users {

  user { 'jbruce':
    ensure   => present,
    home     => '/home/jbruce',
    shell    => '/bin/bash',
    groups   => ['adm','sudo','dip','plugdev',
                 'lpadmin'],
    }

  File {
    ensure => "present",
    owner  => "jbruce",
    group  => "jbruce",
    mode   => 644,
    }

  file { '/home/jbruce/bin':
    ensure => link,
    target => '/home/jbruce/Dropbox/work/bin',
    }

  file { '/home/jbruce/notes':
    ensure => link,
    target => '/home/jbruce/Dropbox/work/manheim/notes',
    }

  file { '/home/jbruce/tmp':
    ensure => directory,
    }

  file { '/home/jbruce/.bashrc':
    ensure  => present,
    source  => 'puppet:///modules/users/bashrc',
    }

  }

# to get the passwd for puppet
# openssl passwd -1
