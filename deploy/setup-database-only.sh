#!/bin/sh

. $(dirname "$0")/init.sh

clear
DOCKER_DIR
OCAK "Composer Install ... mjiimms"
docker exec -it devbox_php_nginx sh -c "composer install"
SLEEP1
OCAK "Create Database ... mjiimms"
docker exec -it devbox_php_nginx sh -c "cd deploy; php database-setup.php"
SLEEP1
OCAK "Migrate Database ... mjiimms"
docker exec -it devbox_php_nginx sh -c "cd sites/admin; php phinx migrate && php phinx seed:run"
