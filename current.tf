data "aws_partition" "current" {}

locals {
  repositories_refs = flatten([
    for repo in var.gitlab_repositories : [
      for ref in repo.refs : {
        ref      = ref
        name     = repo.name
        ref_type = repo.ref_type
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
      values   = [for repo in local.repositories_refs : format("project_path:%s/%s:ref_type:%s:ref:%s", var.gitlab_organisation, repo.name, repo.ref_type, repo.ref)]
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
