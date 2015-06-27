#!/usr/bin/env bash

for f in "$@"
do
	printf "%s %s\n" "$f" "$(./wherefrom.sh "$f" | tr "\n" " ")"
done
