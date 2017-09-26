#!/usr/bin/env sh

config_file=/usr/share/nginx/html/config.js

if [ ! -e "$config_file" ] ; then
  touch "$config_file"
  echo "window.config = { apiUrl: \"$API_URL\"};" > $config_file
  exec "$@"
fi

if [ ! -w "$config_file" ] ; then
  echo "Cannot write to $config_file"
  exit 1
fi
