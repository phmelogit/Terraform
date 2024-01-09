# output "container-Name" {
#     value = docker_container.nodered_container.name
#     description = "Container name."
# }

# output "IP-Address-and-ports" {
#     value = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*].ip_address, i.ports[*].external)]
#     description = "IP adress of the container"
# }