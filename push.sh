#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config --global push.default simple
}

commit_website_files() {
  git commit -am "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/jreisinger/should-do.git > /dev/null 2>&1
  git push --quiet --set-upstream origin
}

setup_git
commit_website_files
upload_files

