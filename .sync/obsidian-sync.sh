#!/bin/bash

git stash

git pull

git stash apply

git add -A

git commit -m "sync"

git push