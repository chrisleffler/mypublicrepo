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

variable "aws_access_key" {
  type = string
  description = "AWS Secret Access Key"
  sensitive = false
}

variable "aws_account_id" {
  type = string
  description = "AWS Account ID"
  sensitive = false
}