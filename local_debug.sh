#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)
cd "$SCRIPT_DIR"

if [[ "${GEM_HOME}" == "" ]]; then
    #echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
    #echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
    #echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
    #source ~/.bashrc
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
fi
gem install jekyll bundler
bundle init
bundle add jekyll

BASE_URL="/rcar-community-board"
# WA for Git bash on windows
if [[ "$(uname | grep MINGW)" != "" ]]; then
    BASE_URL="/${BASE_URL}"
fi
bundle exec jekyll serve --host 0.0.0.0 --baseurl ${BASE_URL}

