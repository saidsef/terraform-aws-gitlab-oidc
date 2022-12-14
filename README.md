# Terraform AWS GitLab OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-gitlab-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-gitlab-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure GitLab Actions as an AWS IAM OIDC identity provider in AWS, which enables GitLab Actions to access resources within an AWS account(s) without requiring long-lived credentials to be stored as GitLab secrets.

## Prerequisites

- AWS Account(s) and credentials
- GitLab repository
- Terraform >= 1.0.x
- Profit?

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "gitlab_oidc" {
  source  = "saidsef/gitlab-oidc/aws"
  version = "main"

  attach_read_only_policy = true
  gitlab_organisation     = "saidsef"
  gitlab_repositories     = [{ name = "terraform-aws-gitlab-oidc", branches = ["main", "pr-*", "*pull*", "*"] }]
  tags                    = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## GitLab Runner

Retrieve temporary credentials via [GitLab Runner](https://github.com/saidsef/terraform-aws-gitlab-oidc/blob/2b26d4f844a0ed52b10c72100e744d38965ab748/.gitlab-ci.yml#L16-L28)

## Source

Our latest and greatest source of `terraform-aws-gitlab-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-gitlab-oidc/). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-gitlab-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.
