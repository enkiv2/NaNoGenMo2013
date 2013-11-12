#!/usr/bin/env zsh
l1=$1
shift
l2=$1
shift
for i in $@ ; do 
	./markov_map_master.sh $l1 $l2 $i
	echo "$i Mapped!"
	./markov_reduce_slave.sh markov.* > .$$
	echo "$i Reduced!"
	rm markov.*
	echo "Clean!"
	mv .$$ markov.out
	echo "Moved!"
done


