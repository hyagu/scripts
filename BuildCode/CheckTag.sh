#!/bin/bash

# 2014/11/27 V0.01

PROJECT_ROOT=/extspace/HTV/2K15_L/devprod
TEST_TAG=""

echo "   _                    _                _   "
echo " _| |_ _____  ____    _| |_ _____  ___ _| |_ "
echo "(_   _|____ |/ _  |  (_   _) ___ |/___|_   _)"
echo "  | |_/ ___ ( (_| |    | |_| ____|___ | | |_ "
echo "   \__)_____|\___ |     \__)_____|___/   \__)"
echo "            (_____|                          "

read -p "what tag you want to test? (e.g. R3.23_HTV_R0.0.0.4):" TEST_TAG

if [[ $TEST_TAG == "" ]]; then
	echo "error, please enter tag."
fi

echo "Testing tag for ... "$TEST_TAG

cd $PROJECT_ROOT

TOTAL_COUNT=$(repo forall -c echo $REPO_PROJECT | wc -l)
TAG_COUNT=$(repo forall -c git tag | grep -c $TEST_TAG)

echo "-----"
echo "Total project count = $TOTAL_COUNT"
echo "Tagged project count = $TAG_COUNT"
echo "-----"

if [[ $TOTAL_COUNT == $TAG_COUNT ]]; then
	echo "oh! yeah! check ok!!!"
else
	echo "oh~no~~~~ your tag fail!, list not tagged project:"
	echo "-----"
	repo forall -c 'if ! [ $(git tag | grep '$TEST_TAG') ]; then echo "$REPO_PROJECT"; fi'
	echo "-----"
fi

