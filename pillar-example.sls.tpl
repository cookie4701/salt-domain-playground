# Copy this file to your pillar_root as top.sls
# Replace all fields with your custom settings for the domain

base:
  '*dc01*':
    - dc_pillar

  'dc_pillar':
    - DOMAIN: REPLACEDOMAIN
    # TLD internal - not officially standarized but ICANN still reserved the name for this purpose
    - TLD: internal
    - DC_PASSWORD: REPLACEPASSWORD
    - COMPANY: REPLACECOMPANY

