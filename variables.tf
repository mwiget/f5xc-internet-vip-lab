variable "project_prefix" {
  type        = string
  default     = "f5xc"
}

variable "owner_tag" {
  type        = string
  default     = "m.wiget@f5.com"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key used to create infrastructure"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key used to create AWS infrastructure"
}

variable "ssh_public_key" {
  type        = string
}

variable "f5xc_api_url" {       
  type = string
}

variable "f5xc_api_cert" {
  type = string
  default = ""
}

variable "f5xc_api_p12_file" {
  type = string
  default = ""
}

variable "f5xc_api_key" {
  type = string
  default = ""
}

variable "f5xc_api_ca_cert" {
  type = string
  default = ""
}

variable "f5xc_api_token" {
  type = string
  default = ""
}

variable "f5xc_tenant" {
  type = string
  default = ""
}

variable "f5xc_aws_cred" {
  type = string
}

variable "bastion_cidr" {
  type        = string
}

