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
      'traceroute',
      'ubuntu-restricted-extras',
      'virtualbox-nonfree',
      'vim',
      'xclip',
      'xchat',
    ]:
  }

  apt::source { 'hipchat':
    location => 'http://downloads.hipchat.com/linux/apt',
    release  => 'stable',
    repos    => 'main',
    key => {
      # apt-key list to get key id
      id     => '729B5780',
      source => 'https://www.hipchat.com/keys/hipchat-linux.key'
      },
    include  => {
      'src' => true,
      'deb' => true,
      }
    }

  package { 'hipchat':
    require => Apt::Source['hipchat']
  }
}
