#!/bin/bash

# not here to screw around
set -e

# source it
source ~/.travis-bashrc

# determine GOROOT
if [ "$GOROOT" != "$HOME/go${GO_VERSION}" ]; then
  echo "Invalid GOROOT: $GOROOT" >&2
  exit 1
else
  echo "GOROOT is valid."
fi

# determine GOPATH
if [ "$GOPATH" != "$HOME/gopath" ]; then
  echo "Invalid GOPATH: $GOPATH" >&2
  exit 1
else
  echo "GOPATH is valid."
fi

# find out which go we're talking about
if [ "$(which go)" != "$HOME/go${GO_VERSION}/bin/go" ]; then
  echo "Invalid Go Binary: $(which go)" >&2
  exit 1
else
  echo "Valid Go Binary on PATH."
fi

# get go environment
go env
