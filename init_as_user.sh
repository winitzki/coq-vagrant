#!/usr/bin/env bash

cd $HOME

# Download and unpack the "software foundations" book
test -s "sf.tar.gz" || wget -q "https://www.cis.upenn.edu/~bcpierce/sf/current/sf.tar.gz"
tar zxf "sf.tar.gz"

# Download Chlipala's book "Certified Programming with Dependent Types" and its code
test -s "cpdt.pdf" || wget -q "http://adam.chlipala.net/cpdt/cpdt.pdf"
test -s "cpdt.tgz" || wget -q "http://adam.chlipala.net/cpdt/cpdt.tgz"
tar zxf "cpdt.tgz"


