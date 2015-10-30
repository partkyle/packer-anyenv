#!/bin/bash -l

set -e

# create the vagrant user
yum makecache -y
yum groupinstall -y "Development Tools"
yum install -y git \
               svn \
               hg \
               bzip2-devel \
               nc \
               openssl \
               openssl-devel \
               readline \
               readline-devel \
               sqlite-devel \
               telnet \
               wget \
               zlib-devel

# clone anyenv
git clone https://github.com/riywo/anyenv /opt/anyenv

ANYENV_FILE="/etc/profile.d/anyenv.sh"
cat > $ANYENV_FILE <<EOF
export ANYENV_ROOT="/opt/anyenv"
export PATH="\$ANYENV_ROOT/bin:$PATH"
eval "\$(anyenv init -)"
EOF

# source the newly created file to have anyenv commands
source $ANYENV_FILE

sudo chmod -R g+rwxXs /opt/anyenv/
sudo chown -R root:wheel /opt/anyenv/

for e in pyenv rbenv goenv plenv phpenv; do
  anyenv install $e
done
