#!/usr/bin/env zsh
y=$1
ttl=$2
while : ; do 
	x="$( ./markov_traverse.sh $y $ttl )" ; 
	echo -e "$x\c" ; 
	y=$(echo $x | sed 's/^.* \([^ ]*\) *$/\1/'); 
	if [[ -z $y ]] ; then 
		len=$(cat markov.out | wc -l) ; 
		r=$((RANDOM%len)) ; 
		y=$(cat markov.out | head -n $((r+1)) | tail -n 1 | cut -f 2) ;
		i=0
		while ( [[ "$y" == "of" ]] || 
			[[ "$y" == "and" ]] || 
			[[ "$y" == "the" ]] || 
			[[ "$y" == "but" ]] || 
			[[ "$y" == "or" ]] || 
			[[ "$y" == "to" ]] || 
			[[ "$y" == "not" ]] || 
			[[ "$y" == "from" ]] || 
			[[ "$y" == "*" ]] || 
			[[ "$y" == "n" ]] || 
			[[ "$y" == "a" ]] || 
			[[ "$y" == "an" ]] || 
			[[ "$y" == "is" ]] ) ; 
		do  
			y=$(cat markov.out | head -n $((r+1)) | tail -n 1 | cut -f 2) ;
			if [[ $i -gt $ttl ]] ; then exit ; fi
			i=$((i+1))
		done
	fi  ; 
done
