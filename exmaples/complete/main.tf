provider "aws" {
  region = var.region
}

module "gitlab_oidc" {
  source = "../../"

  attach_admin_policy           = true
  attach_read_only_policy       = true
  create_oidc_provider          = true
  enabled                       = true
  force_detach_policies         = false
  gitlab_organisation           = var.gitlab_organisation
  gitlab_repositories           = [{ name = "terraform-aws-gitlab-oidc", branches = ["main", "pr-*", "*pull*", "*"] }]
  iam_role_name                 = "gitlab-runner"
  iam_role_path                 = "/"
  iam_role_permissions_boundary = ""
  iam_role_policy_arns          = []
  max_session_duration          = 3600
  tags                          = {}
  url                           = "gitlab.com"
}