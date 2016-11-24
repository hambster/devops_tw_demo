include:
  - api-srv.conf.mysql.setup

/etc/php5/fpm/pool.d/www.conf:
  file.managed:
    - source: salt://api-srv/conf/php-fpm/www.conf
    - user: root
    - group: root
    - mode: 644

/etc/nginx/sites-enabled/default:
  file.absent

/etc/nginx/sites-enabled/php.conf:
  file.managed:
    - source: salt://api-srv/conf/nginx/php.conf
    - user: root
    - group: root
    - mode: 644

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://api-srv/conf/sshd/sshd_config
    - user: root
    - group: root
    - mode: 644

php5-fpm-service:
  service.running:
    - name: php5-fpm
    - enable: True
    - reload: True

nginx-service:
  service.running:
    - name: nginx
    - sig: nginx
    - enable: True
    - reload: True

mysql-service:
  service.running:
    - name: mysql
    - sig: mysql
    - enable: True
    - reload: True
