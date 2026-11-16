/root/test.txt:
  file.managed:
    - source: salt://testfile/content.txt
    - user: root
    - group: wheel
    - mode: 660
    - name: /root/test.txt
