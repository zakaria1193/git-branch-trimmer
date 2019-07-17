#!/bin/bash

trim='\[DEBUG\]' # extended regex for grep

for sha in $(git log --format=format:"%H %s" master..HEAD | grep -E "${trim}" | cut -d " " -f 1)
do
  sha=${sha:0:8}
  sed -i "s/pick $sha/drop $sha/" $@
done

# cat $@
