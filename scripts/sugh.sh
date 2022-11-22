#!/bin/bash

if [ -z "$1" ]; then
	echo "usage: sugh.sh USERNAME|ORGNAME"
	exit 1
else
	name=$1
fi

echo "Cloning all repos for ${name}..."

gh repo list $name --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
