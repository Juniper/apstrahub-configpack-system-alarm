resource "apstra_raw_json" "service_registry" {
  url = "/api/telemetry-service-registry"
  id = "System_Alarms"
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
        service_name = "System_Alarms",
        storage_schema_path = "aos.sdk.telemetry.schemas.iba_integer_data",
      }
  )
}