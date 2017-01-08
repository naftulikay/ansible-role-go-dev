#!/bin/bash

# not here to screw around
set -ex

# grep the bashrc
grep -iP '^export (GOROOT|GOPATH|PATH)=.*' ~/.bashrc

# source it
source ~/.bashrc

# find out which go we're talking about
which go

# get go environment
go env
