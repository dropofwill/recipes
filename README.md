# Recipes

Instead of storing all the recipes I use regularly in my ever growing browser history, I'm putting them here in the [Grocery Recipe Format](https://github.com/cnstoll/Grocery-Recipe-Format), which is a layer on top of Markdown that the iOS app [Grocery](https://apps.apple.com/us/app/grocery-smart-sorting-grocery-list/id1195676848) uses and is quite pleasant to use.

## Development

To load into grocery simply copy files to iPhone (e.g. via AirDrop), then move to Grocery recipe folder.

To add a new recipe use `./new_recipe.sh recipe-name-with-dashes directory-of-type/`

`./build.sh` creates the static site in `target/`

`./publish.sh` deploys it to gh-pages

## License

While most of these originate from others with modifications by me, recipes are not copyright-able (though any introductory prose or photos would be) and thus can be treated as public domain.
