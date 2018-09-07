#!/bin/bash
set -x
set -e
mkdir /project/debs
cp -v /*.deb /*.changes /*.dsc /*.buildinfo /project/debs
chown -R 1000:1000 /project/debs
