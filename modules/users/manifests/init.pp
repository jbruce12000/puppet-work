class users {

  user { 'jbruce':
    ensure   => present,
    home     => '/home/jbruce',
    shell    => '/bin/bash',
    groups   => ['adm','cdrom', 'sudo','dip','plugdev',
                 'lpadmin','vboxusers'],
    }

  file { '/home/jbruce/bin':
    ensure => link,
    target => '/home/jbruce/Dropbox/work/bin',
    }

  file { '/home/jbruce/tmp':
    ensure => directory,
    }

  file { '/home/jbruce/.bashrc':
    ensure  => present,
    source  => 'puppet:///modules/users/bashrc',
    require => Package['samba'],
    }

  }

# to get the passwd for puppet
# openssl passwd -1


