domaincontroller_pkg:
  pkg.installed:
    - name: samba423
    - require:
      file: /usr/etc/sysctl.conf

/usr/etc/sysctl.conf:
  file.managed:
    - source: salt://freebsd/sysctl.conf
    - user: root
    - group: wheel
    - mode: 322
    - name: /usr/etc/sysctl.conf

service_enable_samba:
  service.running:
    - name: samba_server
    - enable: True
    - require:
      pkg: domaincontroller_pkg

provision_samba_domain:
  cmd.run:
    - name: samba-tool domain provsion 
    - unless: [[ -f /var/db/samba4/database.tdb ]]
    - require: 
      - service: service_enable_samba
