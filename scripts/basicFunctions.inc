#!/bin/bash

set -e  # exit on error

SCRIPT_PATH=`dirname $0`

cd $SCRIPT_PATH

# set up color commands
if [ -t 1 -a -t 2 -a \( `type -t tput` = "file" \) ]; then
  _colors=`tput colors`
  if [ "$_colors" -ge 256 ]; then
    INFO () { tput setaf 33;  /bin/echo "$@"; tput sgr0; }
    OK   () { tput setaf 28;  /bin/echo "$@"; tput sgr0; }
    WARN () { tput setaf 226; /bin/echo "$@"; tput sgr0; }
    ERR  () { tput setaf 196; /bin/echo "$@"; tput sgr0; }
  else
    INFO () { tput setaf 4; /bin/echo "$@"; tput sgr0; }
    OK   () { tput setaf 2; /bin/echo "$@"; tput sgr0; }
    WARN () { tput setaf 3; /bin/echo "$@"; tput sgr0; }
    ERR  () { tput setaf 1; /bin/echo "$@"; tput sgr0; }
  fi
else
  INFO () { /bin/echo "$@"; }
  OK   () { /bin/echo "$@"; }
  WARN () { /bin/echo "$@"; }
  ERR  () { /bin/echo "$@"; }
fi


function get_web_getter() {
  # get a getter
  if [ \! -z `type -t curl` ]; then
    GET="curl --silent --location --compressed -O"
  elif [ \! -z `type -t wget` ]; then
    GET="wget --quiet"
  else
    ERR "No getter (curl/wget)"
    exit 1
  fi
  OK Getter is \"$GET\"
}

function check_for_tools() {
  INFO -n 'Tools: '
  for tool in $@; do
    if [ -x `type -t $tool` ]; then
      WARN -n No $tool
    else
      INFO -n "$tool "
    fi
  done
  OK ok.
}

function load_submodule() {
  INFO Load "$1"
  git submodule init $1
  git submodule sync $1
  git submodule update $1
}

function check_for() {
  if [ ! -x `which $1` ]
  then
    ERR "$1 binary not found. $2"
    if [ "non-fatal" -ne "$3" ]
    then
      exit 1
    fi
  fi
}

get_web_getter





