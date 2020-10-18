FROM mariadb:latest
ARG MYSQL_UID
ARG MYSQL_GID

RUN echo ${MYSQL_UID}
RUN usermod -u ${MYSQL_UID} mysql \
&& groupmod -g ${MYSQL_GID} mysql \
&& chown -R mysql:mysql /var/lib/mysql \
&& chown -R mysql:mysql /var/run/mysqld
