# Create a new Datadog - Amazon Web Services integration
resource "datadog_integration_aws" "sandbox" {
  access_key_id = "1234567891234567"
  secret_access_key = var.aws_secret_access_key
  host_tags = ["env:<ENVIRONMENT>","cloud_provider:aws","aws_account:<AWS_ACCOUNT_ID>"]
  ## (List of String) An array of AWS regions to exclude from metrics collection.
  # excluded_regions = []
}