#!/bin/bash

/usr/sbin/apachectl &


if [ ! -f /root/.my.cnf ] ; then
cat > /root/.my.cnf << EOF
[mysqld]
host=localhost
user=root
password=password

[mysqladmin]
host=localhost
user=root
password=password
EOF

chmod 600 /root/.my.cnf
fi


if [[ ! -z ${MYSQL_HOST} ]] ; then
  sed -i "s/\(host=\).*/\1$MYSQL_HOST/" /root/.my.cnf
  sed -i "s/\(^\$DB_HOST\).*/\1 = \"$MYSQL_HOST\";/" /var/www/robinhood/config.php 
  sed -i "s/\(^\s*server\).*/\1 = \"$MYSQL_HOST\";/" /etc/robinhood.d/basic.conf
  sed -i "s/\(^host=\).*/\1\"$MYSQL_HOST\";/g" /root/.my.cnf
fi

if [[ ! -z ${MYSQL_USER} ]] ; then
  sed -i "s/\(user=\).*/\1$MYSQL_USER/" /root/.my.cnf
  sed -i "s/\(^\$DB_USER\).*/\1 = \"$MYSQL_USER\";/" /var/www/robinhood/config.php
  sed -i "s/\(^\s*user\).*/\1 = \"$MYSQL_USER\";/" /etc/robinhood.d/basic.conf
  sed -i "s/\(^user=\).*/\1\"$MYSQL_USER\";/g" /root/.my.cnf
fi

if [[ ! -z ${MYSQL_PWD} ]] ; then
  sed -i "s/\(password=\).*/\1$MYSQL_PWD/" /root/.my.cnf
  sed -i "s/\(^\$DB_PASSWD\).*/\1 = \"$MYSQL_PWD\";/" /var/www/robinhood/config.php
  echo $MYSQL_PWD > /etc/robinhood.d/.dbpassword
  sed -i "s/\(^password=\).*/\1\"$MYSQL_PWD\";/g" /root/.my.cnf
fi

if [[ ! -z ${MYSQL_DB} ]] ; then
  sed -i "s/\(^\$DB_NAME\).*/\1 = \"$MYSQL_DB\";/" /var/www/robinhood/config.php
  sed -i "s/\(^\s*db\).*/\1 = \"$MYSQL_DB\";/" /etc/robinhood.d/basic.conf
fi



exec "$@"

