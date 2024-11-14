@echo off

:: Get project name from user input
set /p PROJECT_NAME="Project Name: "

:: Create project root directory using the provided project name
mkdir %PROJECT_NAME%

:: Navigate into project root
cd %PROJECT_NAME%

::Git file 
git init
:: Create src directory and subdirectories
mkdir src
mkdir src\controllers
mkdir src\models
mkdir src\routes
mkdir src\middleware
mkdir src\config

:: Create public directory and subdirectories
mkdir public
mkdir public\css
mkdir public\js
mkdir public\images

:: Create .env file
echo # Environment Variables > .env
echo DB_HOST=localhost >> .env
echo DB_USER=root >> .env
echo DB_PASS= >> .env
echo API_KEY= >> .env
echo APP_ENV=development >> .env
echo APP_DEBUG=true >> .env

:: Create README.md file
echo # Project Title > README.md
echo Description of your project. >> README.md

:: Create package.json file
echo { > package.json
echo   "name": "%PROJECT_NAME%", >> package.json
echo   "version": "1.0.0", >> package.json
echo   "description": "", >> package.json
echo   "main": "src/app.js", >> package.json
echo   "scripts": { >> package.json
echo     "start": "node src/app.js" >> package.json
echo   }, >> package.json
echo   "author": "", >> package.json
echo   "license": "ISC" >> package.json
echo } >> package.json

:: Create sample app.js file
echo const express = require('express'); > src\app.js
echo const app = express(); >> src\app.js
echo const path = require('path'); >> src\app.js
echo app.use(express.static(path.join(__dirname, '../public'))); >> src\app.js
echo app.listen(3000, () => { >> src\app.js
echo   console.log('Server is running on port 3000'); >> src\app.js
echo }); >> src\app.js

:: Success message
echo Node.js project, %PROJECT_NAME% structure created successfully!

:: Pause for 5 seconds
timeout /t 5

:: Exit script
exit
