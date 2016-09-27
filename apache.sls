apache_install:
  pkg.installed:
    - name: httpd
    - pkgs:
      - httpd
      - mod_ssl
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://templates/apache/httpd.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: httpd
php_install:
  pkg.installed:
    - name: php
    - pkgs:
      - php55u
      - php55u-cli
      - php55u-mysqlnd
      - php55u-mbstring
      - php55u-mcrypt
      - php55u-xml
      - php55u-xmlrpc
      - php55u-intl
      - php55u-pecl-jsonc
      - php55u-pecl-memcache
      - php55u-pecl-memcached
      - php55u-bcmath
      - php55u-gd
      - php55u-opcache
      - php55u-pecl-redis
  file.managed:
    - name: /etc/php.ini
    - source: salt://templates/apache/php.ini
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: php
start_httpd:
  service.running:
    - name: httpd
    - restart: True
    - watch:
      - pkg: httpd
      - pkg: php
      - file: /etc/php.ini
      - file: /etc/httpd/conf/httpd.conf
