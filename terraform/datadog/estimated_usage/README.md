## Install

1. Install [Terraform.](https://developer.hashicorp.com/terraform/downloads)

2. Download [the content of the current Github folder.](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2Fchrisleffler%2Fmypublicrepo%2Ftree%2Fmain%2Fterraform%2Fdatadog%2Festimated_usage)

3. Unzip and change directory into downloaded folder. Run the following commands.
```bash
terraform init
terraform apply -auto-approve
```

4. Add notification destinations to the estimated usage monitors.

>![Add @mention to Datadog monitor.](./images/add-notification.gif)