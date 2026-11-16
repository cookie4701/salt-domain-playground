domaincontroller_pkg:
  pkg.installed:
    - name: samba423

service_enable_samba:
  service.running:
    - name: samba_server
    - enable: True
    - require:
      pkg: domaincontroller_pkg

provision_samba_domain:
  cmd.run:
    - name: samba-tool domain provsion TOBEFILLEDIN
    - unless: [[ -f /var/db/samba4/database.tdb ]]
    - require: 
      - service: service_enable_samba
