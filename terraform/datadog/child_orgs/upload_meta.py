from datadog_api_client import ApiClient, Configuration
from datadog_api_client.v2.api.organizations_api import OrganizationsApi

configuration = Configuration()
with ApiClient(configuration) as api_client:
    api_instance = OrganizationsApi(api_client)
    api_instance.upload_idp_metadata(
        idp_file=open("/Users/chris.leffler/DD/mypublicrepo/terraform/datadog/child_orgs/meta.xml", "rb"),
    )