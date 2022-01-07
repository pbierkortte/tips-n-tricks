#!/bin/bash

rm -rf .git
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:<YOUR ACCOUNT>/<YOUR REPO>.git
git push -u --force origin master
