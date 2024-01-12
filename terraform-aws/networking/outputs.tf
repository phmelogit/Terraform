# --- networking/outputs.tf --- VPC

output "vpc_id" {
  value=aws_vpc.ph_vpc.id
}