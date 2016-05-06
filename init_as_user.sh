#!/usr/bin/env bash

cd $HOME

workdir="sf"

test -d "$workdir" || mkdir -p "$workdir"
cd "$workdir"

test -s "sf.tar.gz" || wget "https://www.cis.upenn.edu/~bcpierce/sf/current/sf.tar.gz"
tar zxf "sf.tar.gz"

