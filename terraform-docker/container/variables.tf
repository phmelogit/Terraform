variable "name_in" {
  description = "name of container"
}
variable "count_in" {}

variable "image_in" {
  description = "name of image"
}

variable "int_port_in" {
  description = "Internal port"
}

variable "ext_port_in" {
  description = "External port"
}

variable "volume_in" {
  description = "Volume container path"
}