#!/usr/bin/env bash

# Increment a version string using Semantic Versioning (SemVer) terminology.

# Parse command line options.

# https://goo.gl/k2a2kK

# while getopts ":mp" Option
# do
#   case $Option in
#     M ) major=true;;
#     m ) minor=true;;
#     p ) patch=true;;
#   esac
# done

case $1 in
  "major") major=true;;
  "minor") minor=true;;
  "patch") patch=true;;
esac

version=$2

# Build array from version string.

a=( ${version//./ } )

# If version string is missing or has the wrong number of members, show usage message.

if [ ${#a[@]} -ne 3 ]
then
  echo "usage: $(basename $0) major/minor/patch current_version"
  exit 1
fi

# Increment version numbers as requested.

if [ ! -z $major ]
then
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

if [ ! -z $minor ]
then
  ((a[1]++))
  a[2]=0
fi

if [ ! -z $patch ]
then
  ((a[2]++))
fi

echo "${a[0]}.${a[1]}.${a[2]}"
