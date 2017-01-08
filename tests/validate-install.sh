#!/bin/bash

# not here to screw around
set -e

# grep the bashrc
grep -iP '^export (GOROOT|GOPATH|PATH)=.*' ~/.bashrc

# source it
source ~/.bashrc

# find out which go we're talking about
if [ "$(which go)" != "$HOME/go${GO_VERSION}/bin/go" ]; then
  echo "Invilid Go Binary: $(which go)" >&2
  exit 1
fi

# get go environment
go env
