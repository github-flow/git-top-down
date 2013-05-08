git hub-clone github-flow/recipes
cd recipes/

git feature start potatoes

cat > potatoes <<EOF
1/2 pound red potatoes
1 gala apple
1/4 quart half-and-half
2 tbsp butter
salt

Cube potatoes. Add potatoes and some salt to cold water. Bring water to boil. Let boil 5 minutes. Cube apples, add. Let boil 10 minutes. Drain. Add milk and butter, then mash.
EOF
git status
git add potatoes
git commit -m 'Added recipe for mashed potatoes.'
git feature review
ed potatoes <<EOF
5s/$/, pepper/
7s/$/ Salt, pepper to taste./
w
EOF
git status
git diff
git add potatoes
git commit -m 'Added salt and pepper to taste.'

git feature review
# Look at the PR
git feature finish
