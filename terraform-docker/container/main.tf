resource "random_string" "random" {
  count   = var.count_in
  length  = 4
  special = false
  upper   = false
}
resource "docker_container" "app_container" {
  count = var.count_in
  name  = join("-", [var.name_in, terraform.workspace, random_string.random[count.index].result])
  image = var.image_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }
  dynamic "volumes" {
    for_each = var.volume_in
    content {
      container_path = volumes.value["container_path"]
      volume_name    = module.volume[count.index].volume_output[volumes.key]
    }
  }
  provisioner "local-exec" {
    when        = create
    command     = "echo ${self.name}: ${join(":", self.network_data[*].ip_address, [for x in self.ports[*]["external"] : x])}  >> ${path.cwd}/../containers.txt"
    interpreter = ["PowerShell", "-Command"]
    on_failure  = fail
  }
  provisioner "local-exec" {
    when        = destroy
    command     = "del ${path.cwd}/../containers.txt"
    interpreter = ["PowerShell", "-Command"]
    on_failure  = continue
  }
}

module "volume" {
  source       = "./volume"
  count        = var.count_in
  volume_count = length(var.volume_in)
  volume_name  = "${var.name_in}-${terraform.workspace}-${random_string.random[count.index].result}-volume"
}