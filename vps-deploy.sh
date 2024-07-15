#!/usr/bin/env bash

# Script to deploy sites to Vultr vps

read -p "Enter which website you would like to deploy to (simply type 1,2 etc): 
1) jezl.xyz
2) personal.jezl.xyz
3) lisa-mckinney.co.uk 
4) norfolkgerringong.com 
5) recipes.jezl.xyz 
6) race-report-gen.jezl.xyz `echo $'\n> '`" SELECTION

if [ $SELECTION -eq 1 ]
then
    npm run build
    #  && scp -r _site/* root@jezl.xyz:/var/www/jezl.xyz
elif [ $SELECTION -eq 2 ]
then
    echo "again!"
fi


echo "Website number $SELECTION has been successfully deployed!"
exit 0