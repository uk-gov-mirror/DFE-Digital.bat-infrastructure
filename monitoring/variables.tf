variable paas_user {}

variable paas_password {}

variable paas_sso_code { default = "" }

variable paas_exporter_username {}

variable paas_exporter_password {}

variable grafana_admin_password {}

variable grafana_google_client_id {}

variable grafana_google_client_secret {}

variable monitoring_space_name {}

variable monitoring_instance_name {}

variable influxdb_service_plan {}

variable alertmanager_slack_url {}

variable alertmanager_app_names {}

locals {
  paas_api_url               = "https://api.london.cloud.service.gov.uk"
  alertmanager_slack_channel = "twd_bat_devops"
  alert_rules_variables = {
    grafana_dashboard_url = "https://grafana-bat.london.cloudapps.digital/d/eF19g4RZx/cf-apps?orgId=1&refresh=10s&var-SpaceName=${var.monitoring_space_name}"
    apps                  = var.alertmanager_app_names
  }
  alert_rules = templatefile("./config/alert.rules.tmpl", local.alert_rules_variables)
}
