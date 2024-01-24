#!/bin/bash --noprofile

# Standard functions:
function fail()         { printf "\n   %s\n" "$*" 1>&2 ; exit 1 ; }
function printAndEval() { printf "\n%s\n" "$*" 1>&2 ; eval "$*" ; }         # Print the command to STDERR, then evaluate:
function indent()       { perl -pe '$|=1; s/^/    /; ' ; }
function ask()          { printf "\n   %s (y/n) ? " "$*" ; read foo ; [[ "$foo" = 'y' ]] ;  }

(head -1 $1 && tail -n +2 $1 | sort --field-separator=, -k 3 -k 4 --ignore-case ) > $1_sorted  # ; diff $1 $1_sorted
