# Terraform-aws-acm

# AWS Infrastructure Provisioning with Terraform

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [License](#license)

## Introduction
This module is basically combination of Terraform open source and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

## Usage
To use this module, you can include it in your Terraform configuration. Here's an example of how to use it:

## Examples

## Example: generate-certificate-dns

```hcl
module "acm" {
  source                    = "git::https://github.com/slovink/terraform-aws-acm.git?ref=v1.0.0"
  name                      = "certificate"
  environment               = "test"
  domain_name               = "slovink.com"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}
```

## Example: generate-certificate-email
```hcl
module "acm" {
  source                    = "git::https://github.com/slovink/terraform-aws-acm.git?ref=v1.0.0"
  name                      = "certificate"
  environment               = "test"
  validate_certificate      = false
  domain_name               = "slovink.com"
  subject_alternative_names = ["www.slovink.com"]
  validation_method         = "EMAIL"
}
```

## Example: import-certificate
```hcl
module "acm" {
  source             = "git::https://github.com/slovink/terraform-aws-acm.git?ref=v1.0.0"
  name               = "certificate"
  environment        = "test"
  import_certificate = true
  private_key        = "./../../../slovink-private-key.pem"
  certificate_body   = "./../../../slovink-cert.pem"
  certificate_chain  = "./../../../slovink-chain.crt"
}
```

## Module Inputs
- `name`: A name for your acm.
- `domain_name`: Domain name for which the certificate should be issued.
- `subject_alternative_names`: Set of domains that should be SANs in the issued certificate.
- `validation_method`: Which method to use for validation. DNS or EMAIL are valid.

- For security group settings, you can configure the ingress and egress rules using variables like:

## Module Outputs
- `id` : The time at which the certificate was issued.
- `arn` :  ARN of the certificate.
- `tags`: Map of tags to assign to the resource.
- `acm_certificate_status` : List of FQDNs that implement the validation.

- Other relevant security group outputs (modify as needed).

## Example
For detailed examples on how to use this module, please refer to the '[example](https://github.com/slovink/terraform-aws-acm/blob/master/example)' directory within this repository.

## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/slovink/terraform-aws-acm/blob/master/LICENSE) file for details.