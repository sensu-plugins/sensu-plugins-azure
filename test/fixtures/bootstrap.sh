#!/bin/bash

# a bootstrap scipt to help setup anything we can mock/integrate to
# run tests against.

# fail on errors
set -e

# update apt-cache and install deps
apt-get update
apt-get install -y wget build-essential

# setup some ruby stuff
source /etc/profile
DATA_DIR=/tmp/kitchen/data
RUBY_HOME=${MY_RUBY_HOME}

# the meat and potatoes

# build and install gem
cd $DATA_DIR
SIGN_GEM=false gem build sensu-plugins-azure.gemspec
gem install sensu-plugins-azure-*.gem
