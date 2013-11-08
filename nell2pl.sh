#!/usr/bin/env zsh
tr -d "'" | 
	sed 's/\t\t*/\t/g;s/\t$//;
	s/^\([^\t]*\)\t\([^\t]*\)\t\([^\t]*\).*$/?- assert(\2('"'"'\1'"'"', '"'"'\3'"'"'))./;
	s/,/'"'"', '"'"'/g;s/'"'"'[ ]*'"'"'/'"'"'/g' |	# sed: strip trailing/repeated tabs
							# turn Event\tRelation\tDetail into fact of form Relation('Event', 'Detail').
							# then, strip out common quoting errors
	tr 'A-Z' 'a-z' | # capital letters are meaningful in prolog; use all-lowercase to make literals atoms
	sed "s/\([(']\)[^(,']*:/\1/g;
	s/_/ /g" | 	# handle another common quoting mistake
			# then substitute underscores for spaces, since NELL seems to have substituted whitespace for underscores already
	sort | uniq |	# comment out this line to save processing time & memory at the cost of having shitloads of duplicate preds
	cat

