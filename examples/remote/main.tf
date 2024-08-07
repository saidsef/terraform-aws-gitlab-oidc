provider "aws" {
  region = var.region
}

module "gitlab_oidc" {
  source  = "saidsef/gitlab-oidc/aws"
  version = ">= 1"

  attach_admin_policy     = true
  attach_read_only_policy = true
  create_oidc_provider    = true
  enabled                 = true
  force_detach_policies   = false
  gitlab_organisation     = "saidsef"
  gitlab_repositories = [{
    name     = "terraform-aws-gitlab-oidc",
    refs     = ["main", "pr-*", "*pull*", "*"]
    ref_type = "branch"

  }]
  iam_role_name                 = "gitlab-runner"
  iam_role_path                 = "/"
  iam_role_permissions_boundary = ""
  iam_role_policy_arns          = []
  max_session_duration          = 3600
  tags                          = {}
  url                           = "gitlab.com"
}
