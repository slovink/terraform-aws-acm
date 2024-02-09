provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## acm Module call with import certificate.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  #  import_certificate = false
  #  private_key        = "./../../../slovink-private-key.pem"
  #  certificate_body   = "./../../../slovink-cert.pem"
  #  certificate_chain  = "./../../../slovink-chain.crt"
}
