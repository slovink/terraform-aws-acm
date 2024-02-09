provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source                    = "./../../"
  name                      = "certificate"
  environment               = "test"
  validate_certificate      = false
  domain_name               = "slovink.com"
  subject_alternative_names = ["www.slovink.com"]
  validation_method         = "EMAIL"
}
