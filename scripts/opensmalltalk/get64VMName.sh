#!/usr/bin/env bash
set -e
set +v

. ./envvars.sh

case $OS in
Darwin) 
	RELEASE=`find . -name "squeak.cog.spur_macos64x64_*" | head -n 1 | sed -E 's/.\/squeak.cog.spur_macos64x64_(.*).dmg/\1/'`
	VM=Squeak64.$RELEASE.app
	VM=$VM/Contents/MacOS/Squeak;;
Linux) 
	RELEASE=`find . -name "sqlinux.*" | head -n 1 | sed -E 's/.\/sqlinux.(.*)/\1/'`
	VM=sqlinux.$RELEASE
	VM=$VM/squeak;;
esac
