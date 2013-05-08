git feature start spaghetti

cat > spaghetti.md <<EOF
1. small handful spaghetti noodles
1. 1 pound hamburger meat
1. 1 can spaghetti sauce
1. water, salt, pepper, oil

* Put noodles, salt, and oil in pot.
* Add water, bring pot to and let boil.
* Fry hamburger.
* Add sauce to hamburger, let simmer.
* Drain noodes; combine noodles and sauce.
EOF

git add spaghetti.md
git ci -m 'Added spaghetti recipe.'
git feature review ; sleep 3
git feature finish

git feature start spaghetti-noodles
ed spaghetti.md <<EOF
1s/small/large/
w
EOF
git add spaghetti.md
git commit -m 'More noodles!'

git feature start spaghetti-vegeterian
ed spaghetti.md <<EOF
2s/hamburger meat/tofu/
w
EOF
git add spaghetti.md
git commit -m 'Vegetarian option.'
git feature review ; sleep 3
git feature finish

git checkout spaghetti-noodles
git feature update