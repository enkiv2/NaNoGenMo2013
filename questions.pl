[nell].
questions(Question, Answer) :- generalizations(X, Y), \+ (Y == mldataset), generalizations(X, Q), \+(Q == Y), Question=['What is your favorite kind of '|Y], Answer=[X|Q].
response([Start|End], [_|Context], Answer) :- X=[Start|' is my favorite kind of '], Y=[X|Context], Z=[Y|' because it is also a '], Q=[Z|End].
qapair(Question, Answer) :- questions(Question, X), response(X, Question, Answer).

