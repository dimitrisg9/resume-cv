#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout master
  git add _data *.pdf
  git commit --message "[skip ci] Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@github.com/dimitrisg9/resume-cv.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages master 
}

setup_git
commit_website_files
upload_files