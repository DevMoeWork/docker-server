FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN apt-get -y update \
    && apt -y update \
    && apt-get -y upgrade \
    && apt -y upgrade \
    && apt-get -y install apache2 \
&& a2enmod rewrite \
&& a2enmod proxy

RUN mkdir /Application \
&& apt-get -y install php7.4-cli \
                       php7.4-zip \
                       php7.4-curl \
                       php7.4-gd \
                       php7.4-geoip \
                       php7.4-ftp \
                       php7.4-iconv \
                       php7.4-ftp \
                       php7.4-gettext \
                       php7.4-intl \
                       php7.4-mysqli \
                       php7.4-mysqlnd \
                       php7.4-phar \
                       php7.4-tokenizer \
&& apt-get -y install libapache2-mod-php7.4 \
&& adduser --disabled-password --gecos '' www-user \
&& apt-get install -y tzdata \
&& ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
&& dpkg-reconfigure --frontend noninteractive tzdata \
&& service apache2 restart

ARG WEB_USER_GID
ARG WEB_USER_UID
ARG WEB_USER_PASSWORD

RUN groupadd -g ${WEB_USER_GID} www-group \
&& usermod -g ${WEB_USER_GID} www-user \
&& usermod -u ${WEB_USER_UID} www-user \
&& echo "www-user:${WEB_USER_PASSWORD}" | chpasswd \
&& a2dismod -f autoindex \
&& a2enconf security \
&& service apache2 restart

EXPOSE 80 443
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]