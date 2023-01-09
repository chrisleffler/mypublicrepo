variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
  sensitive   = true
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog APP Key"
  sensitive   = true
}

variable "datadog_org_name" {
  type        = string
  description = "Datadog Child Org Name"
  sensitive   = false
}

variable "_site" {
  type    = string
  description = "Select the Datadog Site where your organization lives [accepted values datadoghq.com, datadoghq.eu, or ddog-gov.com]:"
}