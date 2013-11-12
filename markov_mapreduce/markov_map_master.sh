#!/usr/bin/env zsh

order=$1
threads=$2

shift; shift;

for i in $@ ; do
	cat $i |sed 's/$/ \\n /;s/\t/ \\t /g' | tr ' \t\r' '\n\n\n' | tr -d '"'"'"'' | grep . | xargs -n$order -P$threads ./markov_map_slave.sh
	echo "Mapped $i"
done


