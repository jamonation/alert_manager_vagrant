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

/home/vagrant/.profile:
  file.append:
    - text:
      - alias load_alert_manager_sql="echo \"CREATE DATABASE IF NOT EXISTS {{ salt['pillar.get']('mysql:name') }}\" |mysql -u root; bzcat /home/vagrant/src/alert_manager/sample/july_alerts.sql.bz2 |mysql -u {{ salt['pillar.get']('mysql:user') }} {{ salt['pillar.get']('mysql:name') }}"
      - alias start_alert_manager="uwsgi --ini /etc/uwsgi/apps-enabled/alert_manager.ini"
