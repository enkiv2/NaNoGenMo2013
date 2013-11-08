NaNoGenMo2013
=============

This is my contribution to https://github.com/dariusk/NaNoGenMo

Thus far, it consists of: 
* nell2pl.sh - a ZSH script that converts the ontology format used by CMU NELL ( http://rtw.ml.cmu.edu/rtw/ ) into valid prolog fact sets
* questions.pl - a set of prolog rules that generate question and answer pairs about subjects covered in the ontology
* fav.sh - a script that generates a list of question and answer pairs about favorite things found in the ontology


The dialog is of the formula:

    What is your favorite $X?
    $Y, because it is also $Z.


For instance:

    What is your favorite actor?
    Tom cruise, because it is also scientologist.

Sample output is here: https://www.dropbox.com/s/s1x1nyof1gf9ikq/favorite_generated_clean.txt

