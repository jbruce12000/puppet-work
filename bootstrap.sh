#!/bin/bash
set -e
set -x

## Install Git and Puppet
# apt-get update
apt-get -y install git-core puppet &
wait

# Clone the 'puppet' repo
cd /etc

if [ -d /etc/puppet ]; then
  if [ -d /etc/puppet-bak ]; then
    rm -rf /etc/puppet-bak
  fi
  mv -f puppet puppet-bak
fi

git clone http://github.com/jbruce12000/puppet-work.git /etc/puppet

# get and configure the modules we need before apply
puppet module install puppetlabs-apt
if [ ! -x /usr/bin/add-apt-repository ]; then
  ln -sf /usr/local/bin/add-apt-repository /usr/bin/add-apt-repository
fi

# run puppet
puppet apply /etc/puppet/manifests/site.pp --modulepath "/etc/puppet/code/modules:/usr/share/puppet/modules:/etc/puppet/modules"
