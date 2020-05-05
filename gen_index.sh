#! /bin/zsh
set -e

mkdir -p target/

# Generate TOC as index.html for all the recipes in this repo
cat \
  <(echo "> No story. Just the recipe. Use as is or upload the .recipe to [Grocery](https://apps.apple.com/us/app/grocery-smart-shopping-list/id1195676848)") \
  <(echo "<div>") \
  <(echo '') \
  <(echo '#### Appetizers') \
  <(git ls-files appetizers/*.recipe | \
    xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
  <(echo '') \
  <(echo '#### Breads') \
  <(git ls-files breads/*.recipe | \
    xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
  <(echo '') \
  <(echo '#### Coffees') \
  <(git ls-files coffees/*.recipe | \
    xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
  <(echo '') \
  <(echo '#### Desserts') \
  <(git ls-files desserts/*.recipe | \
    xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
  <(echo '') \
  <(echo '#### Meals') \
  <(git ls-files meals/*.recipe | \
    xargs -I {} bash -c 'echo - [$(basename {} .recipe)]\($(dirname {})/$(basename {} .recipe).html\)' ) \
  <(echo "</div>") \
  <(echo '') \
  <(echo "# Tags") \
  <(echo '') \
  <(rg --no-line-number --no-heading --no-filename -o '\#[A-Za-z]+\b' \
    {appetizers,breads,coffees,desserts,meals}/*.recipe | \
      sort | uniq -c | sort -r | \
      xargs -I {} bash -c 'echo "- [{}](tags/$(echo "{}" | sed s/.*\#// ).html)"') \
    | \
    pandoc -s -f markdown -t html5 --css styles.css --metadata title="Recipe list" \
    -o target/index.html

# Find all the tags in the recipe
# Sum them up by uniq counts
# Generate markdown list with links to their own pages
cat \
  <(echo "> Recipes by tag") \
  <(echo '') \
  <(rg --no-line-number --no-heading --no-filename -o '\#[A-Za-z]+\b' \
    {appetizers,breads,coffees,desserts,meals}/*.recipe | \
      sort | uniq -c | sort -r | \
      xargs -I {} bash -c 'echo "- [{}](tags/$(echo "{}" | sed s/.*\#// ).html)"') \
      | \
      pandoc -s -f markdown -t html5 --css styles.css --metadata title="Tags" \
      -o target/tags.html

