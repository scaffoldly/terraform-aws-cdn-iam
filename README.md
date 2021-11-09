[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-cdn-iam)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.0-blue.svg)

## Description

This module will create IAM roles for Deployments to a S3 bucket prefixed with the repository name.

## Usage

```hcl
module "CHANGME" {
  source = "scaffoldly/cdn-iam/aws"

  repository_name = "my-public-website"
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
