## puppet-home

use puppet to install my linux mint 18.1 laptop for work


## Setup

This command runs a bootstrap script that installs git-core, puppet, grabs this repo, and runs **puppet apply** against the contents of the repo.

    $ wget -O- -q https://raw.github.com/jbruce12000/puppet-work/master/bootstrap.sh | sudo /bin/bash

