base:
  '*':
    - testfile

  'os_family:FreeBSD':
    - match: grain
    - freebsd

  'G@os_family:FreeBSD and *dc01*':
    - match: compound
    - freebsd.domaincontroller
