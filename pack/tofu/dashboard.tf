resource "apstra_raw_json" "ddos_dashboard" {
  url = format("/api/blueprints/%s/iba/dashboards",var.blueprint_id)
  payload = jsonencode({
    label = "System Alarms",
    description = "",
    grid = [
      [
        {
          label = "Major Alarms",
          description = "",
          type = "stage",
          probe_id = apstra_raw_json.probe.id,
          stage_name = "System_Alarms",
          filter = "value = \"Major\"",
          visible_columns = [
            "properties.system_id",
            "properties.Description",
            "value"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = false,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ],
      [
        {
          label = "Systems with Major Alarms",
          description = "",
          type = "stage",
          probe_id = apstra_raw_json.probe.id,
          stage_name = "Systems_with_Major_Alarms",
          filter = "",
          visible_columns = [
            "properties.system_id",
            "anomaly"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = true,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ],
      [
        {
          label = "Minor Alarms",
          description = "",
          type = "stage",
          probe_id = apstra_raw_json.probe.id,
          stage_name = "System_Alarms",
          filter = "value = \"Minor\"",
          visible_columns = [
            "properties.system_id",
            "properties.Description",
            "value"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = false,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ],
      [
        {
          label = "Systems with Minor Alarms",
          description = "",
          type = "stage",
          probe_id = apstra_raw_json.probe.id,
          stage_name = "Systems_with_Minor_Alarms",
          filter = "",
          visible_columns = [
            "properties.system_id",
            "anomaly"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = true,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs = "none"
        }
      ]
    ],
    default = false,
  }
  )
}