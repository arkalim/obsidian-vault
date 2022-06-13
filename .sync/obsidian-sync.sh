#!/bin/bash

git stash

git pull

# git stash apply
git cherry-pick -n -m1 -Xours stash

git add -A

git commit -m "sync"

git push