git branch potato-measure
git checkout potato-measure

ed potatoes <<EOF
1s/1\/2 pound/3 medium-sized/
q
EOF
git status
git diff
git add potatoes
git commit -m 'Changed potato quantity.'

git push origin potato-measure
# Create pull request - https://github.com/DavidSouther/recipes
git checkout master
# Merge on github
git branch -D potato-measure
git push origin :potato-measure

# But: handles stash, minimizes output, stays in console, handles updating, SEMANTIC

# Quickly run through another demo
git feature start markdown
git mv potatoes potatoes.md
git commit -m 'Moved recipe to markdown formatting.'
git feature review ; sleep 3
git feature finish

# Start one feature branch
git feature start bullets
ed potatoes.md <<EOF
1,5s/^/* /
w
EOF
git add potatoes.md
git commit -m 'Bulleted instructions list'

# In the middle of development, switch to another
git feature start numbers

# Edit the file
ed potatoes.md <<EOF
7c
1. Cube potatoes.
1. Add potatoes and some salt to cold water.
1. Bring water to boil.
1. Let boil 5 minutes.
1. Cube apples, add.
1. Let boil 10 minutes. Drain.
1. Add milk and butter, then mash.
1. Added salt and pepper to taste.
.
w
EOF

git add potatoes.md
git commit -m 'Expanded instructions into numbered list.'
# Finish the second feature
git feature review ; sleep 3
git feature finish

# Go back to the first
git show-branch

git checkout bullets
git rebase master # No output
git feature update # Actually does the rebase
git show-branch

# By hand: (remember to do this any time you start to change files...)
git checkout master
git pull --rebase upstream master
git checkout bullets
git rebase master
# The workflow tools handle keeping things up to date, meaning less chance
# for repos to get out of sync, etc.

# Call this branch done
git feature review ; sleep 3
git feature finish
