#!/bin/bash -l

# not sure why I have to do this in a login shell...
source /etc/profile.d/anyenv.sh

set -e

# python versions
pyenv install 2.6.6
pyenv install 2.7.10

# ruby versions
rbenv install 1.9.3-p551
rbenv install 2.1.5
rbenv install 2.2.3

# go versions
goenv install 1.3.1
goenv install 1.3.2
goenv install 1.3.3
goenv install 1.4.1
goenv install 1.4.2
goenv install 1.5.1
