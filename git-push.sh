read -p "Enter your commit message " MESSAGE 
read -p "Enter your branch name " BRANCH

echo $MESSAGE $BRANCH

git add . && git commit -m "$MESSAGE" && git push origin $BRANCH
exit 0