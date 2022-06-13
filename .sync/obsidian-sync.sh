#!/bin/bash

git stash

git pull

git stash apply

git commit -m "sync"

git push