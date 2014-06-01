#!/bin/sh

sphinx-build -W -b doctest . _build/doctest &&
sphinx-build -W -b html . _build/html &&
git stash &&
git checkout gh-pages &&
git rm -r :/ &&
git reset -- :/CNAME :/.nojekyll :/.gitignore && 
git checkout -- :/CNAME :/.nojekyll :/.gitignore &&
mv ./_build/html/* ../. &&
git add -A :/ &&
git reset -- :/docs &&
git commit -m "Updated documentation" &&
git push origin gh-pages &&
git checkout master &&
git stash pop --index &&
git add -A . &&
git commit -m "Updated documentation" &&
git push origin master
