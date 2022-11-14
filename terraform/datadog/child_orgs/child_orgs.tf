module "create_org" {
  source = "./modules/create_child"

  datadog_api_key = var.datadog_api_key
  datadog_app_key = var.datadog_app_key
}

# Manage Datadog Organization
resource "datadog_organization_settings" "organization" {
  name = "terraformworkedyay"
  settings {
    saml{
      enabled = false
    }
    saml_autocreate_users_domains{
      domains = ["gmail.com"]
      enabled = true
    }
    saml_idp_initiated_login{
      enabled = false
    }
    saml_strict_mode{
      enabled = false
    }
  }

  depends_on = [module.create_org]
}

terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
    }
  }
}

provider "datadog" {
      api_key = module.create_org.org_api_key[0].key
      app_key = module.create_org.org_app_key[0].hash
      validate = false
      #api_url = "https://api.ddog-gov.com/"
}
