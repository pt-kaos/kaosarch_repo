#!/bin/bash

rm kaosarch_repo*

echo "repo-add"
repo-add -n -R kaosarch_repo.db.tar.gz *.pkg.tar.zst

sleep 1

rm kaosarch_repo.db

rm kaosarch_repo.files

mv kaosarch_repo.db.tar.gz kaosarch_repo.db

mv kaosarch_repo.files.tar.gz kaosarch_repo.files

echo "====================================="
echo "=====>     Repo Updated!!!     <====="
echo "====================================="
