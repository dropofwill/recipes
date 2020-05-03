#! /bin/bash

rm -r target/ && \
  ./gen_index.sh && \
  ./gen_html.sh && \
  cp styles.css target/styles.css
