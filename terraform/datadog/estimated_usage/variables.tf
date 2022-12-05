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

variable "_site" {
  type    = string
  description = "Select the Datadog Site where your organization lives [accepted values datadoghq.com, datadoghq.eu, or ddog-gov.com]:"
  
  validation {
        condition     = contains(["datadoghq.com", "datadoghq.eu", "ddog-gov.com"], var._site)
        error_message = "Datadog Site must be one of the following options: datadoghq.com, datadoghq.eu, or ddog-gov.com!"
      }
}

variable "datadog_infra_host_commitment" {
  type        = number
  description = "Enter your committed infrastructure host license count:"
  sensitive   = false
}

variable "datadog_container_commitment" {
  type        = number
  description = "Enter your committed container license count:"
  sensitive   = false
}

variable "datadog_apm_host_commitment" {
  type        = number
  description = "Enter your committed APM host license count:"
  sensitive   = false
}

variable "datadog_rum_sessions_commitment" {
  type        = number
  description = "Enter your committed RUM Session license count:"
  sensitive   = false
}

variable "datadog_syn_api_commitment" {
  type        = number
  description = "Enter your committed Synthetic API license count:"
  sensitive   = false
}

variable "datadog_syn_browser_commitment" {
  type        = number
  description = "Enter your committed Synthetic Browser license count:"
  sensitive   = false
}

variable "datadog_log_indexed_commitment" {
  type        = number
  description = "Enter your committed Synthetic Browser license count:"
  sensitive   = false
}

variable "datadog_log_ingested_commitment" {
  type        = number
  description = "Enter your committed Synthetic Browser license count:"
  sensitive   = false
}