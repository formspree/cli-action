#!/bin/bash

set -e

export FORMSPREE_DEPLOY_KEY="$INPUT_DEPLOYKEY"
npm i @formspree/cli -g
formspree deploy
