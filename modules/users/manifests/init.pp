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
    mode   => "644",
    }

  file { '/usr/bin/python':
    ensure => link,
    target => '/usr/bin/python3',
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
    mode    => "644",
    }

  # run automated updates at 21 minutes past every hour
  cron { "autoupdate":
    command => "sudo apt-get update >>/var/log/update.log; sudo apt-get -y dist-upgrade >>/var/log/update.log; sudo apt-get -y autoremove >>/var/log/update.log; echo '--------------------------------------------------------------------------------' >> /var/log/update.log",
    user    => "root",
    minute  => 21
    }

  }

# to get the passwd for puppet
# openssl passwd -1
