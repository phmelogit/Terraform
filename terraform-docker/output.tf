# output "Internal-ports" {
#     value = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*].ip_address, i.ports[*].internal)]
#     description = "Internal IP adress of the container"
#     sensitive = true
# }

# # output "Network-Bridge-IP-Address" {
# #     value = local.container_networks["bridge"].ip_address
# #     description = "IP adress of bridge network"
# # }

# output "container-Name" {
#     value = module.container[*].container-Name
#     description = "Name of the containers"
# }

# output "IP-Address-and-ports" {
#     value = flatten(module.container[*].IP-Address-and-ports)
#     description = "IP adresses of the containers"
# }