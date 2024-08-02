# Terraform AWS GitLab OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-gitlab-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-gitlab-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure GitLab Runners as an AWS IAM OIDC identity provider in AWS, which enables GitLab Runners to access resources within an AWS account(s) without requiring long-lived credentials to be stored as GitLab secrets.

## Prerequisites

- AWS Account(s) and credentials
- GitLab repository
- Terraform >= 1.x
- ...
- Profit?

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "gitlab_oidc" {
  source  = "saidsef/gitlab-oidc/aws"
  version = ">= 1"

  attach_read_only_policy = true
  gitlab_organisation     = "saidsef"
  gitlab_repositories     = [
  {
      name     = "terraform-aws-gitlab-oidc",
      refs     = ["main", "pr-*", "*pull*", "*"]
      ref_type = "branch"
    },
    {
      name     = "terraform-aws-gitlab-oidc",
      refs     = ["*"]
      ref_type = "tag"
    }
]
  tags                    = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## GitLab Runner

Retrieve temporary credentials via [GitLab Runner](https://github.com/saidsef/terraform-aws-gitlab-oidc/blob/a9f7cf02fd5789b41f2aca5978c752b8fc843977/.gitlab-ci.yml#L16-L28)

https://github.com/saidsef/terraform-aws-gitlab-oidc/blob/a9f7cf02fd5789b41f2aca5978c752b8fc843977/.gitlab-ci.yml#L16-L28

## Source

Our latest and greatest source of `terraform-aws-gitlab-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-gitlab-oidc/). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-gitlab-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.
