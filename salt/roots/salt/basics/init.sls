basic_packages:
  pkg.installed:
    - pkgs:
      - git
      - nfs-common
      - tmux
      - gettext
      - locate
      - curl
      - language-pack-en

uninstalled_packages:
  pkg.purged:
    - pkgs:
      - chef
      - chef-zero
      - puppet
      - puppet-common

uwsgi:
  service:
    - disabled
