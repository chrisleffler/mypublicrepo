# Create a new Datadog Child Organization
resource "datadog_child_organization" "organization" {
  name = "myfirstterraorg"
}

terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
    }
  }
}

provider "datadog" {
      api_key = var.datadog_api_key
      app_key = var.datadog_app_key
      validate = false
      #api_url = "https://api.ddog-gov.com/"
}