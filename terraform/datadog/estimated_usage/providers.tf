provider "datadog" {
      api_key = var.datadog_api_key
      app_key = var.datadog_app_key
      api_url = "https://api.${var._site}/"
}

terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
    }
  }
}