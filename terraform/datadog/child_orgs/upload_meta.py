import os
from datadog_api_client import ApiClient, Configuration
from datadog_api_client.v2.api.organizations_api import OrganizationsApi

configuration = Configuration()
with ApiClient(configuration) as api_client:
    api_instance = OrganizationsApi(api_client)
    api_instance.upload_idp_metadata(
        idp_file=open(os.environ['IDP_META_PATH'], "rb"),
    )