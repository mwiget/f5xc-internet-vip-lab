variable "site_name" {
  type  = string
}
variable "security_group_id" {
  type  = string
  default = ""
}
variable "subnet_id" {
  type  = string
}
variable "ssh_public_key" {
  type  = string
}
variable "vpc_id" {
  type  = string
}
variable "instance_type" {
  type  = string
  default = "t3.nano"
}
variable "owner_tag" {
  type        = string
  default     = "m.wiget@f5.com"
}
