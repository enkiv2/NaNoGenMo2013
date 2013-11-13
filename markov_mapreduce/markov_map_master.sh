#!/usr/bin/env zsh

order=$1
threads=$2

shift; shift;

for i in $@ ; do
	j=1
	while [[ $j -lt $order ]] ; do
		cat $i| tr ' \t\r' '\n\n\n' | tr -d '"'"'"'' | grep . | tail -n +$j | xargs -n$order -P$threads ./markov_map_slave.sh
		echo "$(((j*100)/order))%"
		echo -e "Reducing... \c"
		./markov_reduce_slave.sh markov.* > .$$
		echo "Reduced!"
		echo -e "Cleaning up... \c"
		rm markov.*
		mv .$$ markov.out
		echo "Clean!"
		j=$((j+1))
	done
	echo "Mapped $i"
done


