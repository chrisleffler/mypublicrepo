# Create a new Datadog Archive - Amazon Web Services S3 bucket
resource "datadog_logs_archive" "my_s3_archive" {
  name  = "mys3archive"
  query = "service:myservice"
  s3_archive {
    bucket     = "my-bucket"
    path       = "/path/foo"
    account_id = var.aws_account_id
    role_name  = var.aws_access_key
  }
}