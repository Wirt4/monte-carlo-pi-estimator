#!/bin/sh

# the git hook started the environment 
mojo format .
mojo test
