domaincontroller_pkg:
  pkg.installed:
    - name: samba423
    - require:
      - file: /etc/sysctl.conf

/etc/sysctl.conf:
  file.managed:
    - source: salt://freebsd/sysctl.conf
    - user: root
    - group: wheel
    - mode: 322
    - name: /etc/sysctl.conf

/usr/local/etc/smb4.conf:
  file.managed:
    - source: salt://freebsd/smb4.conf
    - user: root
    - group: wheel
    - mode: 600
    - name: /usr/local/etc/smb4.conf
    - require:
      - pkg: domaincontroller_pkg

/var/db/samba4:
  file.directory:
    - name: /var/db/samba4
    - mode: 644
    - user: root
    - group: wheel
    - makedirs: True
    - require:
      - pkg: domaincontroller_pkg

samba_server:
  service.running:
    - name: samba_server
    - enable: True
    - restart: True
    - sig: smbd
    - require:
      - pkg: domaincontroller_pkg
      - cmd: provision_samba_domain
 

provision_samba_domain:
  cmd.run:
    - name: samba-tool domain provision --use-rfc2307 --realm={{ pillar['dc_pillar']['DOMAIN'].upper() }}.{{ pillar['dc_pillar'].upper() }} --domain={{ pillar['dc_pillar']['DOMAIN'].upper() }} --server-role=dc --dns-backend=SAMBA_INTERNAL --adminpass={{ pillar['dc_pillar']['DC_PASSWORD'] }}
    - unless: test -f /var/db/samba4/private/sam.ldb
    - require:
      - file: /var/db/samba4
