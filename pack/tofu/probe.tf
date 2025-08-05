resource "apstra_raw_json" "probe" {
  url = format("/api/blueprints/%s/probes",var.blueprint_id)
  depends_on = [
    apstra_raw_json.collector
  ]
  payload   = <<-EOT
  {
      "label": "Systems Alarms",
      "description": "",
      "processors": [
        {
          "name": "System_Alarms",
          "type": "extensible_data_collector",
          "properties": {
            "service_name": "System_Alarms_${var.blueprint_id}",
            "service_interval": "60",
            "value_map": {
              "value": {
                "1": "Major",
                "2": "Minor"
              }
            },
            "graph_query": [
              "match(node('system', name='system', deploy_mode='deploy', role=is_in(['leaf', 'access', 'spine', 'superspine'])).out('interface_map').node('interface_map').out('device_profile').node('device_profile', name='DP'))"
            ],
            "service_input": "''",
            "query_group_by": [
              "system"
            ],
            "keys": [],
            "ingestion_filter": {},
            "data_type": "dynamic",
            "query_tag_filter": {
              "filter": {},
              "operation": "and"
            },
            "execution_count": "-1",
            "system_id": "system.system_id",
            "query_expansion": {},
            "enable_streaming": false
          },
          "inputs": {},
          "outputs": {
            "out": "System_Alarms"
          }
        },
        {
          "name": "Major_Alarms_Count",
          "type": "match_count",
          "properties": {
            "group_by": [
              "system_id"
            ],
            "enable_streaming": false,
            "reference_state": "Major"
          },
          "inputs": {
            "in": {
              "stage": "System_Alarms",
              "column": "value"
            }
          },
          "outputs": {
            "out": "Major_Alarms_Count"
          }
        },
        {
          "name": "Minor_Alarms_Count",
          "type": "match_count",
          "properties": {
            "group_by": [
              "system_id"
            ],
            "enable_streaming": false,
            "reference_state": "Minor"
          },
          "inputs": {
            "in": {
              "stage": "System_Alarms",
              "column": "value"
            }
          },
          "outputs": {
            "out": "Minor_Alarms_Count"
          }
        },
        {
          "name": "Systems_with_Major_Alarms",
          "type": "range_check",
          "properties": {
            "property": "value",
            "raise_on_nan": false,
            "raise_anomaly": true,
            "graph_query": [],
            "anomaly_retention_duration": 86400,
            "range": {
              "min": 1
            },
            "enable_streaming": false,
            "anomaly_retention_size": 1073741824,
            "enable_anomaly_logging": false
          },
          "inputs": {
            "in": {
              "stage": "Major_Alarms_Count",
              "column": "value"
            }
          },
          "outputs": {
            "out": "Systems_with_Major_Alarms"
          }
        },
        {
          "name": "Systems_with_Minor_Alarms",
          "type": "range_check",
          "properties": {
            "property": "value",
            "raise_on_nan": false,
            "raise_anomaly": true,
            "graph_query": [],
            "anomaly_retention_duration": 86400,
            "range": {
              "min": 1
            },
            "enable_streaming": false,
            "anomaly_retention_size": 1073741824,
            "enable_anomaly_logging": false
          },
          "inputs": {
            "in": {
              "stage": "Minor_Alarms_Count",
              "column": "value"
            }
          },
          "outputs": {
            "out": "Systems_with_Minor_Alarms"
          }
        }
      ],
      "stages": [
        {
          "name": "Minor_Alarms_Count",
          "description": "",
          "units": {
            "total_count": "",
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        },
        {
          "name": "Systems_with_Minor_Alarms",
          "description": "",
          "units": {
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        },
        {
          "name": "System_Alarms",
          "description": "",
          "units": {
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        },
        {
          "name": "Systems_with_Major_Alarms",
          "description": "",
          "units": {
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        },
        {
          "name": "Major_Alarms_Count",
          "description": "",
          "units": {
            "total_count": "",
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        }
      ]
    }
EOT
}