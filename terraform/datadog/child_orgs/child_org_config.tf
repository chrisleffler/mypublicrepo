#Module to create child org
module "create_org" {
  source = "./modules/create_child"

  datadog_api_key = var.datadog_api_key
  datadog_app_key = var.datadog_app_key
  datadog_org_name = var.datadog_org_name
  _site = var._site
}

#Upload SAML Metadata to child org
resource "null_resource" "metadata-upload" {
  
  triggers = {
    always_run = "${timestamp()}"
  }
  
  provisioner "local-exec" {
      command = "python3 ${path.module}/upload_meta.py"

      environment = {
        IDP_META_PATH = var.idp_meta_path
        DD_SITE = var._site
        DD_API_KEY = module.create_org.org_api_key[0].key
        DD_APP_KEY = module.create_org.org_app_key[0].hash
       }
  }

  depends_on = [module.create_org]
}

# Manage Datadog Organization
resource "datadog_organization_settings" "organization" {
  name = var.datadog_org_name
  settings {
    saml{
      enabled = true
    }
    saml_autocreate_users_domains{
      domains = ["gmail.com"]
      enabled = true
    }
    saml_autocreate_access_role = "st"
    saml_idp_initiated_login{
      enabled = false
    }
    saml_strict_mode{
      enabled = false
    }
  }

  depends_on = [null_resource.metadata-upload]
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
      api_url = "https://api.${var._site}/"
}
