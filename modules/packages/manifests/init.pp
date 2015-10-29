class packages {
include apt

package {
    [ 'awscli',
      'ack-grep',
      'build-essential',
      'checkinstall',
      'curl',
      'dropbox',
      'etherape',
      'keepassx',
      'mumble',
      'evolution',
      'evolution-ews',
      'fdupes',
      'findutils',
      'inkscape',
      'libxml2-utils',
      'nmap',
      'openssh-server',
      'pdftk',
      'password-gorilla',
      'tar',
      'tmux',
      'tofrodos',
      'tig',
      'ubuntu-restricted-extras',
      'virtualbox-nonfree',
      'vim',
      'xclip',
      'xchat',
    ]:
  }

  apt::key { 'hipchat':
    key_source => 'https://www.hipchat.com/keys/hipchat-linux.key',
    }

  apt::source { 'hipchat':
    location => 'http://downloads.hipchat.com/linux/apt',
    release  => 'stable',
    repos    => 'main',
    include  => {
      'src' => true,
      'deb' => true,
      }
    }

  package { 'hipchat':
    require => Apt::Source['hipchat']
  }
}
