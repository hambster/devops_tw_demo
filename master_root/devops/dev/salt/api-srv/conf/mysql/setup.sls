install-python-mysqldb:
  pkg.installed:
    - name: python-mysqldb

/tmp/test_db.sql:
  file.managed:
    - source: salt://api-srv/conf/mysql/test_db.sql
    - user: root
    - group: root
    - mode: 644

mysql < /tmp/test_db.sql:
  cmd.run
    
mysql-user-devops:
  mysql_user.present:
    - host: localhost
    - name: devops
    - password: "devopstw"
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"

mysql-grant-test-db:
  mysql_grants.present:
    - grant: all privileges
    - database: devops.*
    - user: devops
