#!/usr/bin/env bash

read -p "Enter the AppID, public API key and index name, each separated with a space and wrapped in quotes" APPID KEY INDEX

JS='import algoliasearch from "algoliasearch/lite";\nimport instantsearch from "instantsearch.js";\nimport { searchBox, hits } from |"instantsearch.js/es/widgets";\n\nconst searchClient = algoliasearch('$APPID', '$KEY');\n\nconst search = instantsearch({\n\tindexName: '$INDEX',\n\tsearchClient,\n});\n\nsearch.addWidgets([\n\tsearchBox({\n\t\tcontainer: "#searchbox"\n\t}),\n\thits({\n\t\tcontainer: "#hits"\n\t})\n]);\nsearch.start();'

HTML='<!DOCTYPE html>\n<html lang="en">\n\t<head>\n\t\t<meta charset="UTF-8" />\n\t\t<meta name="viewport" content="width=device-width, initial-scale=1.0" />\n\t\t<title>Document</title>\n\t</head>\n\t<body>\n\t\t<div class="" id="searchbox"></div>\n\t\t<div class="" id="hits"></div>\n\t\t<script src="index.js" type="module"></script>\n\t</body>\n</html>'

npm init -y && npm i algoliasearch instantsearch.js parcel && echo -e "$JS" > index.js && echo -e "$HTML" > index.html