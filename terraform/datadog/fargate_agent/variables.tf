variable "datadog_api_key_arn" {
  type        = string
  description = "Datadog API Key Secrets Manager ARN"
  sensitive   = true
}

variable "task_execution_arn" {
  type        = string
  description = "Task execution ARN"
  sensitive   = true
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
  sensitive   = true
}