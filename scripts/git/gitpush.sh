#!/bin/bash

git add .
read -p "Nome para commit: " commit
git commit -m "$commit"