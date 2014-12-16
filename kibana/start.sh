#!/bin/bash

if [ -n "${KIBANA_HTACCESS}" ]; then
    for user in ${KIBANA_HTACCESS}; do
        htpasswd -nb "${user%:*}" "${user#*:}" >> /var/www/kibana.htaccess
    done
    
    sed -i '/location \/ {/i \ \ \ \ auth_basic "Authentication required";' /etc/nginx/sites-enabled/kibana
    sed -i '/location \/ {/i \ \ \ \ auth_basic_user_file /var/www/kibana.htaccess;' /etc/nginx/sites-enabled/kibana
fi

exec nginx -g "daemon off;"
