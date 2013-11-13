#!/usr/bin/env zsh

start=$1
ttl=$2
function multiply() {
	awk '{ 
		times=$1;
		$1=""
		for (i=0; i<times; i++) print $0 
	}'
}
function randline() {
	f=.$$
	cat >| $f
	len=$(cat $f  | wc -l)
	if [[ $len -gt 0 ]] ; then
		l=$((RANDOM % len))
		cat $f | head -n $((l+1)) | tail -n 1
	fi
	rm $f
}

echo -e "${start} \c"
i=0
while [[ $i -lt $ttl ]] && [[ ! -z $start ]] ; do
	pred=""
	temp=$i
	while [[ -z $pred ]] && [[ $i -lt $ttl ]]  ; do 
		line=$(cat markov.out | grep  "^[0-9]*$(echo -e \\t)$start" | multiply | randline)
		pred=$(echo $line | sed "s/^ *$start *//")
		i=$((i+1))
		#sleep 0.5
	done
	if [[ $i -gt $((ttl-temp)) ]] ; then
		start=$(echo $pred | sed 's/^.* \([^ ]*\)$/\1/')
	else 
		start=$pred
	fi
	i=$temp
	echo -e "${start} \c"
	i=$((i+1))
done
echo
