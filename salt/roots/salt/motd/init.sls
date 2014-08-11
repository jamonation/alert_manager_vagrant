/etc/motd:
  file.managed:
    - source: salt://motd/motd

/etc/pam.d/sshd:
  file.replace:
    - path: 
    - pattern: "^session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate$"
    - repl: "#session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate"
    - count: 1
