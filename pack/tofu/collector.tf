resource "apstra_raw_json" "collector" {
  depends_on = [
    apstra_raw_json.service_registry
  ]
  url = "/api/telemetry/collectors"
  id = "System_Alarms_${var.blueprint_id}"
  payload = jsonencode({
    service_name = "System_Alarms_${var.blueprint_id}",
    collectors = [
      {
        platform = {
          os_type = "junos",
          os_version =  "21.2r2",
          family = "junos,junos-ex,junos-qfx",
          model = ""
        },
        source_type = "cli",
        cli = "show system alarms",
        query = {
          accessors = {
            Description = "/alarm-information/alarm-detail/alarm-description",
            alarm_class = "/alarm-information/alarm-detail/alarm-class"
          },
          keys = {
            Description = "Description",
          },
          values = {
            value = "int(1 if alarm_class == \"Major\" else 2 if alarm_class == \"Minor\" else None)"
          },
          filter = ""
        },
        relaxed_schema_validation = true
      }
    ],
  }
  )
}