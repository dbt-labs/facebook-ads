
# Facebook Ads

This package models Facebook Ads data.

[Here](https://developers.facebook.com/docs/marketing-api/using-the-api) is info
from Facebook's API.

# Installation Instructions

[Here](https://docs.getdbt.com/docs/package-management) is some additional 
information about packages in dbt, icnluding installation instructions. 
If you haven't already, you will need to create a `packages.yml` file in your project.

You should then copy the adwords package structure from the `dbt_project.yml` in
this repository into your project's `dbt_project.yml` file and replace the `#`
values with the adwords table names from your warehouse.

## Stitch

[Here](https://www.stitchdata.com/docs/integrations/saas/facebook-ads) 
is info about Stitch's Facebook Ads connector.

## Fivetran

[Here](https://fivetran.com/docs/applications/facebook-ad-account) 
is info about Fivetran's Facebook Ad Account connector.

The Insights connector is used to pull in the fb_ad_insights table.

[Here](https://fivetran.com/docs/applications/facebook-ads-insights) 
is info about Fivetran's Facebook Ad Insights connector.

The Ad Account connector is used to pull in all tables except the insights table.

### Contributing
Additional contributions to this repo are very welcome! Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package. All PRs should only include functionality that is contained within all Segment deployments; no implementation-specific details should be included.