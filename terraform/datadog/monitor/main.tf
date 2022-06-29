# Create a new Datadog monitor
resource "datadog_monitor" "foo" {
  name               = "Name for terraform monitor"
  type               = "metric alert"
  message            = "Monitor triggered."
  escalation_message = "Escalation message."

  query = "avg(last_5m):sum:azure.usage.current_value{*} > 2"

  monitor_thresholds {
    critical          = 2
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  tags = ["terraform:true"]
}