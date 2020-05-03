#! /bin/bash

mkdir -p target/{appetizers,breads,coffees,desserts,meals} && \
  git ls-files {appetizers,breads,coffees,desserts,meals}/*.recipe | \
  xargs -I {} bash -c 'pandoc -s -f markdown -t html5 --css styles.css -o target/$(dirname {})/$(basename {} .recipe).html {}'

