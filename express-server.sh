read -p "Please enter the directory name and port you would like to use: " DIRECTORY PORT

EXPRESS_SERVER=$(cat <<EOF
const express = require("express");
const app = express();
const port = $PORT;

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/index.html");
});

app.listen(port, () => {
    console.log(\`App listening on port \${port}\`);
});
EOF
)

HTML='<!DOCTYPE html>\n<html lang="en">\n<head>\n\t<meta charset="UTF-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n<title>Document</title>\n</head>\n<body>\n<h1>Example app</h1>\n</body>\n</html>'

changeStartScript() {
    sed 's/"start": "node server.js"/"start": "nodemon server.js"/' package.json
}


if [[ (-z $DIRECTORY) || ( -z $PORT ) ]]
then 
    echo "not enough parameters passed"
    continue
elif [[ ! $PORT =~ ^[0-9]+$  ]]
then
    echo "Port must contain only numbers"
    continue
else
    mkdir $DIRECTORY && cd $DIRECTORY && echo $EXPRESS_SERVER > server.js && echo $HTML > index.html && npm init -y && npm i express && npm i nodemon --save-dev &&  code .
fi

exit 0

