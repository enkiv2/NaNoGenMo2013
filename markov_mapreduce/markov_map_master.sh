#!/usr/bin/env zsh

order=$1
threads=$2

shift; shift;

for i in $@ ; do
	j=1
	while [[ $j -lt $order ]] ; do
		cat $i| sed 's/$/ \\n /;s/\t/ \\t /g' | tr ' \t\r' '\n\n\n' | tr -d '"'"'"'' | grep . | tail -n +$j | xargs -n$order -P$threads ./markov_map_slave.sh
		j=$((j+1))
	done
	echo "Mapped $i"
done


