#! /usr/bin/env bash

# ---------------------------------------------------------------------------- #
#                       Get to the project root directory                      #
# ---------------------------------------------------------------------------- #

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd -P "$( dirname "$SOURCE" )"

# ---------------------------------------------------------------------------- #
#                               Define constants                               #
# ---------------------------------------------------------------------------- #

ROOT_DIR=$(pwd)
echo -e "Working in '$ROOT_DIR'\n"

# ---------------------------------------------------------------------------- #
#                                 Run commands                                 #
# ---------------------------------------------------------------------------- #

# Discover and apply fixes for auto-fixable issues
dart fix --apply
echo ""

# Fix formatting of dart files
dart format --set-exit-if-changed .
echo ""

# Check for remaining issues
dart analyze . --fatal-warnings

# ---------------------------------------------------------------------------- #
#                                  Clean exit                                  #
# ---------------------------------------------------------------------------- #

exit 0
