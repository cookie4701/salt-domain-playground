# Copy this file to your pillar_root as dc.sls
# Replace all fields with your custom settings for the domain

# do not forget to reload pillar data on the minion:
# salt '*dc01*' saltutil.refresh_pillar

# check the pillar data on the minion
# salt '*dc01*' pillar.items

'dc':
    DOMAIN: REPLACEDOMAIN
    # TLD internal - not officially standarized but ICANN still reserved the name for this purpose
    TLD: internal
    DC_PASSWORD: REPLACEPASSWORD
    COMPANY: REPLACECOMPANY
