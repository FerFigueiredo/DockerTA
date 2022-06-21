FROM php:7.0.25-apache

LABEL Amin Mkh <mukh_amin@yahoo.com> 

# installing required stuff
RUN apt-get update \
    && apt-get install -y unzip libaio-dev libmcrypt-dev libcurl4-gnutls-dev libxml2-dev libgd-barcode-perl libgmp-dev \
       libc-client-dev libkrb5-dev ldap-utils libssl-dev libzip-dev git \
    && rm -r /var/lib/apt/lists/* \
    && apt-get clean -y

# PHP extensions
RUN \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli

RUN \
    docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli
    
RUN \
    docker-php-ext-configure mcrypt \
    && docker-php-ext-install mcrypt
    
RUN \
    docker-php-ext-configure bcmath \
    && docker-php-ext-install bcmath
  
RUN \
    docker-php-ext-configure calendar \
    && docker-php-ext-install calendar
    
RUN \
    docker-php-ext-configure ctype \
    && docker-php-ext-install ctype
    
RUN \
    docker-php-ext-configure dba \
    && docker-php-ext-install dba
    
RUN \
    docker-php-ext-configure exif \
    && docker-php-ext-install exif
    
RUN \
    docker-php-ext-configure fileinfo \
    && docker-php-ext-install fileinfo
    
RUN \
    docker-php-ext-configure gettext \
    && docker-php-ext-install gettext
RUN \
    docker-php-ext-configure iconv \
    && docker-php-ext-install iconv
RUN \
    docker-php-ext-configure json \
    && docker-php-ext-install json
    
RUN \
    docker-php-ext-configure mbstring \
    && docker-php-ext-install mbstring
    
RUN \
    docker-php-ext-configure opcache \
    && docker-php-ext-install opcache

RUN \
    docker-php-ext-configure pdo \
    && docker-php-ext-install pdo
    
RUN \
    docker-php-ext-configure posix \
    && docker-php-ext-install posix
    
RUN \
    docker-php-ext-configure shmop \
    && docker-php-ext-install shmop
    
RUN \
    docker-php-ext-configure sockets \
    && docker-php-ext-install sockets
    
RUN \
    docker-php-ext-configure sysvmsg \
    && docker-php-ext-install sysvmsg
    
RUN \
    docker-php-ext-configure sysvsem \
    && docker-php-ext-install sysvsem
    
RUN \
    docker-php-ext-configure sysvshm \
    && docker-php-ext-install sysvshm
    
RUN \
    docker-php-ext-configure tokenizer \
    && docker-php-ext-install tokenizer

RUN \
    docker-php-ext-configure curl \
    && docker-php-ext-install curl
    
RUN \
    docker-php-ext-configure soap \
    && docker-php-ext-install soap
    
RUN \
    docker-php-ext-configure zip \
    && docker-php-ext-install zip

RUN \
    docker-php-ext-configure dom \
    && docker-php-ext-install dom    

RUN \
    docker-php-ext-configure ftp \
    && docker-php-ext-install ftp    

RUN \
    docker-php-ext-configure gmp \
    && docker-php-ext-install gmp

RUN \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap
    
# RUN \
#     docker-php-ext-configure ldap \
#     && docker-php-ext-install ldap

# RUN \
#     docker-php-ext-configure simplexml \
#     && docker-php-ext-install simplexml
    
# RUN \
#     docker-php-ext-configure snmp \
#     && docker-php-ext-install snmp
    
# RUN \
#     docker-php-ext-configure sqlite3 \
#     && docker-php-ext-install sqlite3
    
# RUN \
#     docker-php-ext-configure xml \
#     && docker-php-ext-install xml
    
# RUN \
#     docker-php-ext-configure xml_wddx \
#     && docker-php-ext-install xml_wddx
    
# RUN \
#     docker-php-ext-configure xmlreader \
#     && docker-php-ext-install xmlreader
    
# RUN \
#     docker-php-ext-configure xmlrpc \
#     && docker-php-ext-install xmlrpc
    
# RUN \
#     docker-php-ext-configure xmlwriter \
#     && docker-php-ext-install xmlwriter
    
# RUN \
#     docker-php-ext-configure xsl \
#     && docker-php-ext-install xsl
    
# RUN \
#     docker-php-ext-configure z-memcached \
#     && docker-php-ext-install z-memcached

# RUN \
#     docker-php-ext-configure bz2 \
#     && docker-php-ext-install bz2
    
# RUN \
#     docker-php-ext-configure igbinary \
#     && docker-php-ext-install igbinary

# RUN \
#     docker-php-ext-configure gd \
#     && docker-php-ext-install gd

# RUN \
#     docker-php-ext-configure odbc \
#     && docker-php-ext-install odbc
    
# RUN \
#     docker-php-ext-configure pgsql \
#     && docker-php-ext-install pgsql

# RUN \
#     docker-php-ext-configure pdo_odbc \
#     && docker-php-ext-install pdo_odbc
    
# RUN \
#     docker-php-ext-configure pdo_pgsql \
#     && docker-php-ext-install pdo_pgsql
    
# RUN \
#     docker-php-ext-configure pdo_sqlite \
#     && docker-php-ext-install pdo_sqlite
    
# RUN \
#     docker-php-ext-configure phar \
#     && docker-php-ext-install phar    

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

# apache configurations, mod rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# Oracle instantclient

# copy oracle files
# ADD oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
ADD https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip /tmp/
# ADD oracle/instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/
ADD https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-sdk-linux.x64-21.1.0.0.0.zip /tmp/
# ADD oracle/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /tmp/
ADD https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-sqlplus-linux.x64-21.1.0.0.0.zip /tmp/

# unzip them
RUN unzip /tmp/instantclient-basic-linux.x64-*.zip -d /usr/local/ \
    && unzip /tmp/instantclient-sdk-linux.x64-*.zip -d /usr/local/ \
    && unzip /tmp/instantclient-sqlplus-linux.x64-*.zip -d /usr/local/

# install oci8
RUN ln -s /usr/local/instantclient_*_1 /usr/local/instantclient \
    && ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus 

RUN docker-php-ext-configure oci8 --with-oci8=instantclient,/usr/local/instantclient \
    && docker-php-ext-install oci8 \
    && echo /usr/local/instantclient/ > /etc/ld.so.conf.d/oracle-insantclient.conf \
    && ldconfig

# xdebug
ADD https://xdebug.org/files/xdebug-2.8.1.tgz /tmp/

RUN tar -xvzf /tmp/xdebug-2.8.1.tgz -C /usr/local/ \
    && cd /usr/local/xdebug-2.8.1 \
    && phpize \
    && ./configure \ 
    && make \
    && cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012 \
    && touch /usr/local/etc/php/conf.d/99-xdebug.ini \
    && echo zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so >> /usr/local/etc/php/conf.d/99-xdebug.ini

# set others variables as you like in php.ini
RUN touch /usr/local/etc/php/conf.d/docker-php-ext-others.ini \
    && echo include_path = ".:/var/www/html/library/includes:/var/www/html/framework/library" > /usr/local/etc/php/conf.d/docker-php-ext-include-path.ini \
    && echo default_charset = "ISO-8859-1" >> /usr/local/etc/php/conf.d/docker-php-ext-include-path.ini \
    && echo error_reporting = "E_ERROR"  >> /usr/local/etc/php/conf.d/docker-php-ext-include-path.ini