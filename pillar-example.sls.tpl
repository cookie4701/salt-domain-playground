# Copy this file to your pillar_root as top.sls

base:
  '*dc01*':
    - dc_pillar

  'dc_pillar':
    - domain: REPLACEDOMAIN
    - dc_admin: REPLACEADMIN
    - dc_password: REPLACEPASSWORD

