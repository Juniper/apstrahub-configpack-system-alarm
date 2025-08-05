resource "apstra_raw_json" "service_registry" {
  url = "/api/telemetry-service-registry"
  id = "System_Alarms_${var.blueprint_id}"
  payload = jsonencode(
    {
      description        = "Alarms service registry"
      application_schema = {
        properties = {
          key = {
            properties = {
              Description ={
                type = "string"
              },
            },
            required = [
              "Description"
            ],
            type = "object"
          },
          value = {
            type = "integer"
          }
        }
          required = [
            "key",
            "value"
          ],
          type = "object"
        },
        service_name = "System_Alarms_${var.blueprint_id}",
        storage_schema_path = "aos.sdk.telemetry.schemas.iba_integer_data",
      }
  )
}