#!/usr/bin/env zsh

cat $@ | awk '{
	count=$1;
	$1="";
	if ($0 in strs) {
		strs[$0]+=count
	} else {
		strs[$0]=count
	}
} END { 
	for (k in strs) { 
		print strs[k]  k
	} 
}' | tr ' ' '\t'

