provider "aws" {
  region = "eu-west-1"
}

locals {
  domain = "slovink.com"
}

module "acm" {
  source                    = "./../../"
  name                      = "certificate"
  environment               = "test"
  domain_name               = "slovink.com"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}
