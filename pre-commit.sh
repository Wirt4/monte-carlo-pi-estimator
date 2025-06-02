#!/bin/sh

# the git hook starts the environment 
mojo format .
mojo test
