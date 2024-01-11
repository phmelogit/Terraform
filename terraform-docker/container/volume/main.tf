resource "docker_volume" "container_volume" {
  count = var.volume_count
  name  = "${var.volume_name}-${count.index}"
  lifecycle {
    prevent_destroy = false
  }
  provisioner "local-exec" {
    when        = destroy
    command     = "mkdir ${path.cwd}/../backup"
    interpreter = ["PowerShell", "-Command"]
    on_failure  = continue
  }
  provisioner "local-exec" {
    when = destroy
    # command = "tar -czvf ${path.cwd}/../backup/${self.name}.tar.gz ${self.mountpoint}" <-- Lunix
    command     = "tar -czvf ${path.cwd}/../backup/${self.name}.tar.gz \\\\wsl.localhost\\docker-desktop-data\\data\\docker\\volumes\\${self.name}"
    interpreter = ["PowerShell", "-Command"]
    on_failure  = fail
  }
}
