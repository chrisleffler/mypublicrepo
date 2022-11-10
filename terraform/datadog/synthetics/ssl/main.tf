# Array of hostnames
locals {
  host = ["google.com", "google.ca"] #Update with your endpoint/host list
}

# Example Usage (Synthetics SSL test)
# Loop through host variable to create/update/delete a Datadog Synthetics API/SSL tests
resource "datadog_synthetics_test" "test_ssl" {
  for_each = toset(local.host)
  type    = "api"
  subtype = "ssl"
  request_definition {
    host = "https://${each.key}"
    port = 443
  }
  assertion {
    type     = "certificate"
    operator = "isInMoreThan"
    target   = 14
  }
  locations = ["aws:us-east-1"]
  options_list {
    tick_every         = 86400 #Test interval time in seconds
    monitor_name = "Datadog : Host : ${each.key} : Certificate expiring < 14"
    monitor_priority = 3
  }
  name    = "Certificate Expire ${each.key}"
  message = "Datadog : Host : ${each.key} : Certificate expiring < 14 \\ @chris.leffler@datadoghq.com" #Update with your desired message. The string should be a single line and written in markdown -- https://daringfireball.net/projects/markdown/syntax
  tags    = ["env:production"] #Update with desired tag(s)

  status = "live"
}