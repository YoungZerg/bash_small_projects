#!/bin/bash
TOP_COUNT=5
NGINX_LOG_FILE_PATH=$1

if [[ ! -f "$NGINX_LOG_FILE_PATH"  ]]; then
  echo "Error: provided file path is not valid"
  echo "Script usage: $0 /path/to/nginx/access.log"
  exit 1
fi


echo "Top ${TOP_COUNT} IP addresses with the most requests:"
cut -d ' ' -f1 "$NGINX_LOG_FILE_PATH" | sort | uniq -c | sort -rn | head -n ${TOP_COUNT} | awk '{print $2 " - " $1 " requests"}'


echo -e "\nTop ${TOP_COUNT} most requestes paths:"
cut -d ' ' -f7 "$NGINX_LOG_FILE_PATH" | sort | uniq -c | sort -rn | head -n ${TOP_COUNT} | awk '{print $2 " - " $1 " requests"}'

echo -e "\nTop ${TOP_COUNT} most response status codes:"
awk '{print $9}' "$NGINX_LOG_FILE_PATH" | sort | uniq -c | sort -rn | head -n ${TOP_COUNT} | awk '{print $2 " - " $1 " requests"}'

echo -e "\nTop ${TOP_COUNT} user agents:"
awk -F\" '{print $6}' "$NGINX_LOG_FILE_PATH" | sort | uniq -c | sort -rn | head -n ${TOP_COUNT} | awk '{print $2 " - " $1 " requests"}'
