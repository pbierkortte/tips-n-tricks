#!/bin/bash

git log --oneline --all
git checkout --orphan new-master
git add -A
git commit -m "Initial commit"
git branch -D master
git branch -m master
git push -f origin master
git log --oneline --all
