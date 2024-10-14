#!/usr/bin/env bash

current_date=$(date +"%Y-%m-%d")
output_date="[JL.$current_date]"
echo $output_date | pbcopy
echo "Timestamp copied, past it into SF!"

exit 0