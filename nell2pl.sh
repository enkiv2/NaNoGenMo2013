#!/usr/bin/env zsh
tr -d "'" | sed 's/\t\t*/\t/g;s/\t$//;s/^\([^\t]*\)\t\([^\t]*\)\t\([^\t]*\).*$/?- assert(\2('"'"'\1'"'"', '"'"'\3'"'"'))./;s/,/'"'"', '"'"'/g;s/'"'"'[ ]*'"'"'/'"'"'/g' | tr 'A-Z' 'a-z' | # jesus christ. this looked cleaner when I wrote it, I promise. 
	sed "s/\([(']\)[^(,']*:/\1/g;s/_/ /g" | 
	sort | uniq	# comment out this line to save processing time & memory at the cost of having shitloads of duplicate preds
