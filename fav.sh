#!/usr/bin/env zsh
prolog -q -s <(cat nell.pl questions.pl) -t "questions(X, Y),writeln(X), writeln(Y), false." 2>/dev/null | 
	sed 's/^.\([a-z][^|]*\)|\(.*\).$/\1, because it is also \2\n/' |	# format our response appropriately 
	tr -d '[]|' | 								# get rid of prolog list format
	tee favorite_generated.txt | 						# save to a temp file
	sed 's/^W\(.*\)$/W\1?/' | 						# add question marks to the ends of the questions
	sed 's/^$/%/' | 							# separate stanzas
	tr -d '\n' | tr '%' '\n' | 
	sort | uniq | 								# deduplicate
	sed 's/$/\n/;s/?/?\n/' | 
	sed 's/^\([^W].*\)$/\1./' | 						# add periods to the ends of the responses
	python <(echo -e "import sys\nfor x in sys.stdin.readlines():\n\tprint(x.capitalize().rstrip())") | # capitalize
	sed 's/kind of //' | 							# your favorite KIND OF actor isn't tom cruise
	tee favorite_generated_clean.txt

