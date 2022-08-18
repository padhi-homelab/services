#!/usr/bin/env bash

set -Eumo pipefail

# NOTE: This is a partial inlining of `mysql_note` and `mysql_log` functions
# at https://github.com/MariaDB/mariadb-docker/blob/master/docker-entrypoint.sh#L5-L12
log () {
  printf '%s [%s] [Entrypoint]: %s\n' "$(date --rfc-3339=seconds)" "Note" "$*"
}

# NOTE: This is the `docker_sql_escape_string_literal` function
# at https://github.com/MariaDB/mariadb-docker/blob/master/docker-entrypoint.sh#L258-L265
sql_escape_string_literal () {
	local newline=$'\n'
	local escaped=${1//\\/\\\\}
	escaped="${escaped//$newline/\\n}"
	echo "${escaped//\'/\\\'}"
}

# NOTE: This is a partial inlining of `docker_process_sql` and `docker_exec_client` functions
# at https://github.com/MariaDB/mariadb-docker/blob/master/docker-entrypoint.sh#L236-L256
process_sql () {
  MYSQL_PWD=$MARIADB_ROOT_PASSWORD \
    mysql --protocol=socket \
          -uroot -hlocalhost \
          --database=mysql \
          "$@"
}

find /profiles -maxdepth 1 -type f -name '*' -print0 | \
while IFS= read -r -d '' profile ; do
  log "Creating profile $profile"
  source "$profile"

  log "Adding user $MYSQL_USER"
  userPasswordEscaped=$( sql_escape_string_literal "$MYSQL_PASSWORD" )
  process_sql --binary-mode <<-EOSQL_USER
  SET @@SESSION.SQL_MODE=REPLACE(@@SESSION.SQL_MODE, 'NO_BACKSLASH_ESCAPES', '');
  CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$userPasswordEscaped';
EOSQL_USER

  log "Creating database $MYSQL_DATABASE"
	process_sql <<<"CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;"

  log "Giving user $MYSQL_USER access to schema $MYSQL_DATABASE"
  process_sql <<<"GRANT ALL ON \`${MYSQL_DATABASE//_/\\_}\`.* TO '$MYSQL_USER'@'%' ;"
done
