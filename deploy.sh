#!/bin/bash
echo "Your PATH is $PATH"
echo "You are on branch $TRAVIS_BRANCH"
echo "The TRAVIS_PULL_REQUEST_BRANCH is $TRAVIS_PULL_REQUEST_BRANCH"
if [[ "$TRAVIS_PULL_REQUEST_BRANCH" = "" ]]
then
echo "you are on master, deploying production."
netlify deploy -a $NETLIFY_KEY --prod --dir=public
else 
  echo "you are not on master, deploying preview."
netlify deploy -a $NETLIFY_KEY --dir=public
fi
