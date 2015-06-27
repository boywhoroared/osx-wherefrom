#!/usr/bin/env bash

# Sources:
# http://stackoverflow.com/questions/26723926/where-from-value-in-get-info-of-a-file
# http://ferd.ca/awk-in-20-minutes.html
# https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/mdls.1.html

FILE="$@"

function where_from {
  # Get the output from OS X metadata about the where the file came from .
  # OS X saves this metadata as an extra attribute on the file
  # (It also saves it somewhere else in a DB, but that is another story)
  data="$(mdls -name kMDItemWhereFroms -raw $1)"
  # Ignoring any lines beginning with `(` or `)`, print the source
  sources=$(printf "%s" "$data" | awk "! /^(\\(|\\))/ { print \$1 }" -)
  printf "%s" "$sources"
}

where_from $FILE
