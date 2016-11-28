class packages {
include apt

package {
    [ 'awscli',
      'ack-grep',
      'bogofilter-common',
      'bogofilter-sqlite',
      'build-essential',
      'checkinstall',
      'curl',
      'conky',
      'disper',
      'dropbox',
      'etherape',
      'evolution',
      'evolution-ews',
      'fdupes',
      'findutils',
      'inkscape',
      'keepassx',
      'libxml2-utils',
      'mumble',
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
