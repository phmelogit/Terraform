output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "Name, IP and port for each application."
}