output "org_api_key" {
  value       = datadog_child_organization.organization.api_key
  description = "Child org api key"
  sensitive   = false
}

output "org_app_key" {
  value       = datadog_child_organization.organization.application_key
  description = "Child org app key"
  sensitive   = false
}