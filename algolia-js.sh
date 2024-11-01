#!/usr/bin/env bash

while true; do
    read -p "Are you using this for search or write operations? Type 'search' or 'write': " MODE
    if [[ $MODE == 'search' ||  $MODE == 'write' ]]; then
        break
    else 
        echo "Invalid option"
    fi
done


read -p "Type your directory name: " DIRECTORY
read -p "AppID: " APPID
read -p "Index name: " INDEX_NAME

if [ $MODE == 'search' ]; then
    read -p "Your search API key: " SEARCH_KEY
        break
    else
        read -p "Your search API key: " SEARCH_KEY
        read -p "Your write API key: " WRITE_KEY
fi


mkdir $DIRECTORY && cd $DIRECTORY && npm init -y && npm install algoliasearch@5

JS_CODE=$(cat <<EOF
import { algoliasearch } from "algoliasearch";

const appID = "$APPID";
const apiKey = "$SEARCH_KEY";
const indexName = "$INDEX_NAME";

const client = algoliasearch(appID, apiKey);
EOF
)

echo $JS_CODE > index.js