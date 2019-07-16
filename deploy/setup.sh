#!/bin/sh

. $(dirname "$0")/init.sh

clear
DOCKER_DIR
OCAK "SETUP mjiimms ..."
OCAK "$_OCAK_INTRO" "$_OCAK_OWN" "" "START CONTAINER:" ">> $APP_NAME" ">> $DB_NAME"
BR
pwd
docker-compose up -d
SLEEP1
OCAK "COMMAND STOP CONTAINER:" "bash deploy/halt"
SLEEP1
OCAK "Composer Install ... mjiimms"
docker exec -it web_dev sh -c "composer install"
SLEEP1
OCAK "Create Database ... mjiimms"
docker exec -it web_dev sh -c "cd deploy; php database-setup.php"
SLEEP1
OCAK "Migrate Database ... mjiimms"
docker exec -it web_dev sh -c "cd sites/admin; php phinx migrate && php phinx seed:run"
SLEEP1
OCAK "NPM Install ... mjiimms"
cd ../
npm install
OCAK "Bower Install ... mjiimms"
bower install
