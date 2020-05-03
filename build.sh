#! /bin/bash

rm -rf target/ && \
  ./gen_index.sh && \
  ./gen_html.sh && \
  cp styles.css target/styles.css
