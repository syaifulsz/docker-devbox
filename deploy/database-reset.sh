#!/bin/sh

. $(dirname "$0")/init.sh

clear
DOCKER_DIR
OCAK "Create Database ... WNM"
docker exec -it web_dev sh -c "cd deploy; php database-setup.php"
SLEEP1
OCAK "Migrate Database ... WNM"
# docker exec -it web_dev sh -c "cd sites/admin; php phinx migrate && php phinx seed:run"
docker exec -it web_dev sh -c "cd sites/admin; php phinx migrate"
