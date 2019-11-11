#!/usr/bin/env bash

# show a cyan `OK!`, or arg `1` message
function show_info()
{
  local msg="OK!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;36m${msg}\033[0m"
}

# show a magneta `OK!`, or arg `1` message
function show_info_alt()
{
  local msg="OK!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;35m${msg}\033[0m"
}

# show a green `Success!`, or arg `1` message
function show_success()
{
  local msg="Success!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;32m${msg}\033[0m"
}

# show a yellow `Warning!`, or arg `1` message
function show_warning()
{
  local msg="Warning!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;33m${msg}\033[0m"
}

# show a red `Error!`, or arg `1` message
function show_error()
{
  local msg="Error!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;31m${msg}\033[0m"
}