#!/bin/bash -e

if test -z "$MYSQL_ENV_MYSQL_PASSWORD"; then
    echo "**** link to a mysql database, e.g. --link database-container:mysql" 1>&2
    exit 1
fi
cat > /etc/safechat.json <<EOF
{
  "mysql": {
    "host"              : "mysql",
    "user"              : "${MYSQL_ENV_MYSQL_USER}",
    "port"              : ${MYSQL_PORT_3306_TCP_PORT},
    "password"          : "${MYSQL_ENV_MYSQL_PASSWORD}",
    "database"          : "${MYSQL_ENV_MYSQL_DATABASE}",
    "max_allowed_packet": 1000000000
  }
}
EOF
nodejs safechat.js ${PORT}
