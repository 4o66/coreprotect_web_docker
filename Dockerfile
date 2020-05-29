FROM php:apache
MAINTAINER Sean Cox <throwarock@gmail.com>

#add dependancies
RUN apt-get update && apt-get install -y libsqlite3-dev git
RUN docker-php-ext-install pdo pdo_mysql pdo_sqlite

EXPOSE 80
CMD ["apache2-foreground"]

#add entrypoint
ADD coreprotectweb-entrypoint.sh /usr/local/bin/coreprotectweb-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/coreprotectweb-entrypoint.sh"]
 
VOLUME /var/www/html

#ENV ADMIN_PASSWORD="admin"
#ENV USER_PASSWORD="user"
#ENV DB_TYPE="sqlite"
#ENV DB_PATH="path/to/database.db"
#ENV MYSQL_HOST="localhost:3306"
#ENV MYSQL_DB="minecraft"
#ENV MYSQL_USER="username"
#ENV MYSQL_PASSWORD="password"
#ENV MYSQL_FLAGS="none"
#ENV MYSQL_PREFIX="co_"
#ENV PREBLOCK_NAME="true"
#ENV MAP_LINK="https://localhost:8123/?worldname={world}&mapname=surface&zoom=3&x={x}&y={y}&z={z}"
