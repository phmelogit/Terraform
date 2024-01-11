variable "image" {
  type        = map(any)
  description = "Image for container"
  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "quay.io/influxdb/influxdb:v2.0.2"
      prod = "quay.io/influxdb/influxdb:v2.0.2"
    }
    grafana = {
      dev  = "grafana/grafana-oss"
      prod = "grafana/grafana-oss"
    }
  }
}

variable "ext_port" {
  # type = list
  type = map(any)
  # validation {
  #   condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
  #   error_message = "The external port must be in the valid port range 0 - 65535"
  # }
  # validation {
  #   condition = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
  #   error_message = "The external port must be in the valid port range 0 - 65535"
  # }
}


# locals {
#   container_networks = {
#     for net in docker_container.nodered_container[*].network_data :
#     net.network_name => net
#   }
# }