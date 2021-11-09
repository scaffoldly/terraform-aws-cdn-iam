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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.64.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_identity.identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_iam_access_key.access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_policy_document.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name for the Public Webiste (role names are prefixed with this for service-level isololation of privileges) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_access_identity_arn"></a> [cloudfront\_access\_identity\_arn](#output\_cloudfront\_access\_identity\_arn) | The CloudFront S3 access identity |
| <a name="output_cloudfront_access_identity_path"></a> [cloudfront\_access\_identity\_path](#output\_cloudfront\_access\_identity\_path) | The CloudFront S3 access identity |
| <a name="output_deployer_access_key"></a> [deployer\_access\_key](#output\_deployer\_access\_key) | The AWS Access Key that can be used for deploys |
| <a name="output_deployer_arn"></a> [deployer\_arn](#output\_deployer\_arn) | The ARN of the user that can be used for deploys |
| <a name="output_deployer_secret_key"></a> [deployer\_secret\_key](#output\_deployer\_secret\_key) | The AWS Secret Key that can be used for deploys |
<!-- END_TF_DOCS -->
