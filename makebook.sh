#!/bin/bash
gitbook build .
rm -rf ../github_mydoc_pages/*
cp -rf _book/ ../github_mydoc_pages/
cd ../github_mydoc_pages/
git add .
git commit -a -m "auto commit"
git fetch
git rebase
git push
