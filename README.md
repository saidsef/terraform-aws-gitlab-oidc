# Terraform AWS GitLab OIDC Provider [![CI](https://github.com/saidsef/terraform-aws-gitlab-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure GitLab Actions as an AWS IAM OIDC identity provider in AWS, which enables GitLab Actions to access resources within an AWS account(s) without requiring long-lived credentials to be stored as GitLab secrets.

## Prerequisites

- AWS Account(s) and credentials
- GitLab repository
- Terraform >= 1.1.x
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

## Source

Our latest and greatest source of `terraform-aws-gitlab-oidc` can be found on [GitLab](#deployment). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://gitlab.com/saidsef/terraform-aws-gitlab-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.