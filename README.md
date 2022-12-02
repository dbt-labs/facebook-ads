
> ⛔🏚️ This package is obsolete and no longer developed. Fivetran users should use [fivetran/facebook_ads](https://hub.getdbt.com/fivetran/facebook_ads/latest/) instead. 


# Facebook Ads

This package models Facebook Ads data.

[Here](https://developers.facebook.com/docs/marketing-api/using-the-api) is info
from Facebook's API.

# Installation Instructions

[Here](https://docs.getdbt.com/docs/package-management) is some additional 
information about packages in dbt, including installation instructions. 
If you haven't already, you will need to create a `packages.yml` file in your project.

You should then copy these variables into your root `dbt_project.yml`, and fill in with the names of Facebook ads tables in your warehouse:
```
vars:

  etl:                                   #stitch or fivetran
  ads_table:                             #table
  ad_creatives_table:                    #table
  adsets_table:                          #table
  campaigns_table:                       #table
  ads_insights_table:                    #table
  ad_creatives__child_links_table:       #table -- disable if on snowflake

  url_tag_table:                         #only for fivetran
```

## Stitch

[Here](https://www.stitchdata.com/docs/integrations/saas/facebook-ads) 
is info about Stitch's Facebook Ads connector.

## Fivetran

[Here](https://fivetran.com/docs/applications/facebook-ad-account) 
is info about Fivetran's Facebook Ad Account connector.

The Ad Account connector is used to pull in all tables except the insights table.

[Here](https://fivetran.com/docs/applications/facebook-ads-insights) 
is info about Fivetran's Facebook Ad Insights connector.

The Insights connector is used to pull in the fb_ad_insights table.

### Contributing
Additional contributions to this repo are very welcome! Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package. All PRs should only include functionality that is contained within all Segment deployments; no implementation-specific details should be included.