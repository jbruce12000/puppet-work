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

  file { '/home/jbruce/.config/disper':
    ensure => directory,
    mode => 755,
    }

  file { '/home/jbruce/.config/disper/config':
    ensure  => present,
    source  => 'puppet:///modules/users/disper.config',
    require => File['/home/jbruce/.config/disper']
    }
  
  file { '/home/jbruce/.conkyrc':
    ensure  => present,
    source  => 'puppet:///modules/users/conkyrc',
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

  # has the proper hosts entry of "files dns" 
  file { '/etc/nsswitch.conf':
    ensure  => present,
    source  => 'puppet:///modules/users/nsswitch.conf',
    owner   => "root",
    group   => "root",
    mode    => 644,
    }

  # prevent laptop being closed from shutting of my monitor
  file { '/etc/systemd/logind.conf':
    ensure  => present,
    source  => 'puppet:///modules/users/logind.conf',
    owner   => "root",
    group   => "root",
    mode    => 644,
    }

  # prevent laptop being closed from locking my screen
  file { '/etc/UPower/UPower.conf':
    ensure  => present,
    source  => 'puppet:///modules/users/UPower.conf',
    owner   => "root",
    group   => "root",
    mode    => 644,
    }

  }

# to get the passwd for puppet
# openssl passwd -1
