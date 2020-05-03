#! /bin/bash

# Generate TOC as index.html for all the recipes in this repo

mkdir -p target/ &&
  cat \
    <(echo "> No story. Just the recipe. Use as is or upload the .recipe to [Grocery](https://apps.apple.com/us/app/grocery-smart-shopping-list/id1195676848)") \
    <(echo '') \
    <(echo '## Appetizers') \
    <(git ls-files appetizers/*.recipe | \
      xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
    <(echo '') \
    <(echo '## Breads') \
    <(git ls-files breads/*.recipe | \
      xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
    <(echo '') \
    <(echo '## Coffees') \
    <(git ls-files coffees/*.recipe | \
      xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
    <(echo '') \
    <(echo '## Desserts') \
    <(git ls-files desserts/*.recipe | \
      xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
    <(echo '') \
    <(echo '## Meals') \
    <(git ls-files meals/*.recipe | \
      xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
      | pandoc -s -f markdown -t html5 --css styles.css --metadata title="Recipe list" -o target/index.html

