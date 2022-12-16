
# Create a new Datadog monitor
resource "datadog_monitor" "log_indexed_anom" {
  name               = "Datadog Log Event Indexing is anomalous for {{service.name}}"
  type               = "metric alert"
  message            = "Your Datadog Log Event Indexing for {{service.name}} is {{value}} which is an anomalous spike or drop. Recommend [Plan & Usage evaluation](https://app.${var._site}/billing/usage) or contact your Datadog Account Team."

  query = "avg(last_4h):anomalies(sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false} by {service}.as_count(), 'agile', 2, direction='both', interval=60, alert_window='last_15m', count_default_zero='true', seasonality='daily') >= 1"

  notify_no_data    = false
  renotify_interval = 60
  renotify_statuses = ["alert"]

  notify_audit = false
  include_tags = true

  tags = ["terraform:true","estimated_usage:true"]
}