#!/bin/bash
function create_user
{
  user=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-24};echo;`
  pass=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-24};echo;`

  echo "=============================="
  echo "user: $user"
  echo "pass: $pass"
  echo "=============================="

  htpasswd -b -c /opt/nginx-passwd $user $pass
}

if [ ! -f /opt/nginx-passwd ]; then
  create_user
fi

#nginx -g daemon off;
exec "$@"

