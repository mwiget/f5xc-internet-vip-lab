provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  region = "eu-north-1"
  alias  = "eu-north-1"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "us-east-2"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

provider "volterra" {
  api_p12_file = var.f5xc_api_p12_file
  api_cert     = var.f5xc_api_p12_file != "" ? "" : var.f5xc_api_cert
  api_key      = var.f5xc_api_p12_file != "" ? "" : var.f5xc_api_key
  api_ca_cert  = var.f5xc_api_ca_cert
  url          = var.f5xc_api_url
}
