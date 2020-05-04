#! /bin/bash
# Usage:
# Create a new recipe filled out with some boilerplate
#   ./new_recipe.sh dash-case-name-of-recipe directory-name

# Don't overwrite existing recipes
# set -o noclobber
# Fail program on first error
set -e

if [ -z $1 ] || [ -z $2 ]; then
  echo -e "Need to pass recipe name and type"
  echo -e "Usage: ./new_recipe.sh dash-case-name-of-recipe directory-name"
  exit 1;
fi

# dashed-name
NAME=$1
# a type of recipe one atm one of appetizers, breads, coffees, desserts, meals
# removes slashes for directory auto-complete convenience
TYPE=$(echo "$2" | sed s/\\///g)
# Local file location
LOCATION=$(echo "$TYPE/$NAME.recipe")
# Convert "dashed-name" to "Dashed name"
TITLE=$(echo "$(tr '[:lower:]' '[:upper:]' <<< ${NAME:0:1})${NAME:1}" | sed s/\-/\ /g)

# .recipe permalink
LINK=$(echo "https://raw.githubusercontent.com/dropofwill/recipes/master/$LOCATION")

export NAME=$NAME
export TYPE=$TYPE
export TITLE=$TITLE
export LINK=$LINK

echo "Creating recipe $TITLE in $TYPE with permalink $LINK in location $LOCATION"

if [ ! -f $LOCATION ] || [ -s $LOCATION ]; then
  echo "Recipe doesn't already exists"
  envsubst < _template.recipe > /dev/stdout
  envsubst < _template.recipe > $LOCATION
  $EDITOR $LOCATION
else
  echo "Recipe already exists"
  $EDITOR $LOCATION
fi

