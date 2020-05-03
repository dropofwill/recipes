#! /bin/bash

git checkout gh-pages
git add -f target/
git commit -m "Deploying $(git rev-parse HEAD)"
git push -f origin `git subtree split --prefix target`:gh-pages
git checkout master
