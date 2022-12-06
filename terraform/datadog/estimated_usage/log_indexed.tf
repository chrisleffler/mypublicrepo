
# Create a new Datadog monitor
resource "datadog_monitor" "log_indexed" {
  name               = "Datadog Log Event Indexing is high"
  type               = "metric alert"
  message            = "Your Datadog APM Host usage is {{value}} which is within 20% of your commitment. Recommend [Plan & Usage evaluation](https://app.${var._site}/billing/usage) or contact your Datadog Account Team."

  query = "sum(last_1h):datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false} > ${var.datadog_log_ingested_commitment * ".8"}"

  monitor_thresholds {
    critical          = format("%d", var.datadog_log_ingested_commitment * ".8")
  }

  notify_no_data    = false
  renotify_interval = 60
  renotify_statuses = ["alert"]

  notify_audit = false
  include_tags = true

  tags = ["terraform:true","estimated_usage:true"]
}