/etc/uwsgi/apps-enabled/alert_manager.ini:
  file.managed:
    - source: salt://alert_manager/uwsgi.ini

/home/vagrant/src/alert_manager/config.ini:
  file.managed:
    - source: salt://alert_manager/config.ini
    - template: jinja

/srv/www:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True

/srv/www/alert_manager:
  file.symlink:
    - target: /home/vagrant/src/alert_manager
    - owner: vagrant
    - group: vagrant
    - require:
      - file: /srv/www

alert_manager_create_database:
  mysql_database:
    - present
    - name: {{ salt['pillar.get']('mysql:name') }}
    - require:
      - pkg: mysql-server

alert_manager_load_database:
  cmd.run:
    - name: bzcat /home/vagrant/src/alert_manager/sample/july_alerts.sql.bz2 |mysql {{ salt['pillar.get']('mysql:name') }}
    - require:
      - mysql_database: {{ salt['pillar.get']('mysql:name') }}
