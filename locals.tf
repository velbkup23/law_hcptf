locals {
  location = "centralindia"

  flattened_monitor_resources = [
    for resource in var.monitor_resources : merge(
      resource,
      {
        sequence = try(format("%03d", tonumber(split("-", resource.name)[1])), "001")
        name     = split("-", resource.name)[0]
      }
    )
  ]

}