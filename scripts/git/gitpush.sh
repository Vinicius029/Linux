#!/bin/bash

clear
git add .
read -p "Nome para commit: " commit
git commit -m "$commit"
git status
git push