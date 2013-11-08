prolog -q -s <(cat nell.pl questions.pl) -t "questions(X, Y),writeln(X), writeln(Y), false." 2>/dev/null | sed 's/^.\([a-z][^|]*\)|\(.*\).$/\1, because it is also \2\n/' | tr -d '[]|' | tee favorite_generated.txt
cat favorite_generated.txt| sed 's/^W\(.*\)$/W\1?/' | sed 's/^$/%/' | tr -d '\n' | tr '%' '\n' | sort | uniq | sed 's/$/\n/;s/?/?\n/' | sed 's/^\([^W].*\)$/\1./' | python <(echo -e "import sys\nfor x in sys.stdin.readlines():\n\tprint(x.capitalize().rstrip())") | sed 's/kind of //' | tee favorite_generated_clean.txt

