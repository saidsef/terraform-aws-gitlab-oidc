data "aws_partition" "current" {}

locals {
  repositories_branches = flatten([
    for repo in var.gitlab_repositories : [
      for branch in repo.branches : {
        branch = branch
        name   = repo.name
      }
    ]
  ])
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "ForAnyValue:StringLike"
      values   = [for repo in local.repositories_branches : format("project_path:%s/%s:ref_type:branch:ref:%s", var.gitlab_organisation, repo.name, repo.branch)]
      variable = format("%s:sub", var.url)
    }

    principals {
      identifiers = [local.oidc_provider.arn]
      type        = "Federated"
    }
  }

}

data "aws_iam_openid_connect_provider" "provider" {
  count = var.enabled && !var.create_oidc_provider ? 1 : 0

  url = format("https://%s", var.url)
}

data "tls_certificate" "provider" {
  url = format("https://%s/.well-known/openid-configuration", var.url)
}
