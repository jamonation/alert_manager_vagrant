purged_packages:
  pkg.purged:
    - pkgs:
      - python-setuptools 
      - python-imaging
      - python-mysqldb
      - python-pylibmc
      - python-coverage
      - ipython
      - python-sqlparse
      - python-pyquery
      - python-pygments
      - pylint
      - pyflakes

installed_packages:
  pkg.installed:
    - pkgs:
      - python-pip
      - python-virtualenv
      - python-dev
      - uwsgi
      - uwsgi-plugin-python
  require:
    - pkg: purged-packages

alert_manager_requirements:
  pip.installed:
    - requirements: salt://alert_manager/requirements.txt