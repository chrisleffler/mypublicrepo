# Source a role
data "datadog_role" "admin_role" {
  filter = "Datadog Admin Role"
}

# Create a new Datadog user
resource "datadog_user" "foo" {
  email = "chris.j.leffler@gmail.com"

  roles = [data.datadog_role.admin_role.id]
  send_user_invitation = true
}