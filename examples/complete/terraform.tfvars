attach_admin_policy     = false
attach_read_only_policy = true
create_oidc_provider    = true
enabled                 = true
force_detach_policies   = false
gitlab_organisation     = "saidsef"
gitlab_repositories = [
  {
    name     = "example-repo"
    refs     = ["main", "develop"] # Example list of refs
    ref_type = "branch"            # Example ref_type
  }
]
iam_role_name                 = "gitlab-runner"
iam_role_path                 = "/"
iam_role_permissions_boundary = ""
iam_role_policy_arns          = []
max_session_duration          = 3600
region                        = "eu-west-1"
tags                          = {}
url                           = "gitlab.com"
