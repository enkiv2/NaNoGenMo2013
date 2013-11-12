#!/usr/bin/env zsh

# Produce a file with $# order, $#-1 order, ... 2-order chaining

maxOrder=$#
minOrder=2
args=("$@")

order=maxOrder
while [[ $order -gt $((minOrder-1)) ]] ; do
	i=1
	while [[ $i -lt $# ]] && [[ $((i+order)) -lt $((maxOrder+1)) ]] ; do
		j=$i
		while [[ $((j-i)) -lt $((order+1)) ]] && [[ $j -lt $((maxOrder+1)) ]] ; do
			arg=$args[$j]
			echo -e "$arg \c"
			j=$((j+1))
		done
		echo
		i=$((i+1))
	done
	order=$((order-1))
done | sort | uniq -c | sed 's/^ *//' | tr ' ' '\t' > markov.$$
echo -e ".\c"

