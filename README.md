<<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS  Acm
</h1>


<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.0-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-aws-acm/blob/master/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>



</p>
<p align="center">

<a href='https://www.facebook.com/Slovink.in=https://github.com/slovink/terraform-aws-acm'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/company/101534993/admin/feed/posts/=https://github.com/slovink/terraform-aws-acm'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>



- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)



## Prerequisites

This module has a few dependencies:

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)



## Introduction
This Terraform module creates an AWS acm along with additional configuration options.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/slovink/terraform-aws-acm/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **slovink** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/slovink/terraform-aws-acm/blob/master/LICENSE) file for details.

## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-aws-acm/issues), or feel free to drop us an email at [concat@slovink.com](concat@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-aws-acm)!


## About us
At https://slovink.com/ we offer expert guidance, implementation support and services to help organisations accelerate their journey to the slovi. Our
services include docker and container orchestration, slov migration and adoption, infrastructure automation, application modernisation and
remediation, and performance engineering.



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

