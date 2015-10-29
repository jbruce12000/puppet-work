#!/bin/bash
set -e
set -x

## remove Git and Puppet
apt-get -y remove git-core puppet

rm -rf /etc/puppet
rm -rf /etc/puppet-bak
