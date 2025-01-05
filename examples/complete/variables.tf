variable "attach_admin_policy" {
  default     = false
  description = "Enable attachment of the AdministratorAccess policy"
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Enable attachment of the ReadOnly policy"
  type        = bool
}

variable "create_oidc_provider" {
  default     = true
  description = "Enable creation of the GitLab OIDC provider"
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Enable creation of resources"
  type        = bool
}

variable "force_detach_policies" {
  default     = false
  description = "Force detachment of policies attached to the IAM role"
  type        = bool
}

variable "gitlab_organisation" {
  description = "GitLab organisation name"
  type        = string

  validation {
    condition     = length(var.gitlab_organisation) > 0
    error_message = "GitLab organisation name must not be empty."
  }
}

variable "gitlab_repositories" {
  type = list(object({
    name     = string
    refs     = list(string)
    ref_type = string
  }))
  default = [
    {
      name     = ""
      refs     = []
      ref_type = ""
    }
  ]
  description = "List of GitLab repository name(s) and refs names or patterns"

  validation {
    condition     = alltrue([for repo in var.gitlab_repositories : length(repo.name) > 0])
    error_message = "Each GitLab repository must have a non-empty name."
  }
}

variable "iam_role_name" {
  default     = "gitlab-runner"
  description = "Name of the IAM role"
  type        = string

  validation {
    condition     = length(var.iam_role_name) > 0
    error_message = "IAM role name must not be empty."
  }
}

variable "iam_role_path" {
  default     = "/"
  description = "Path to the IAM role"
  type        = string
  sensitive   = false

  validation {
    condition     = length(var.iam_role_path) > 0
    error_message = "IAM role path must not be empty."
  }
}

variable "iam_role_permissions_boundary" {
  default     = ""
  description = "ARN of the permissions boundary to be used by the IAM role"
  type        = string
  sensitive   = false
}

variable "iam_role_policy_arns" {
  default     = []
  description = "List of IAM policy ARNs to attach to the IAM role"
  type        = list(string)
  sensitive   = false
}

variable "max_session_duration" {
  default     = 3600
  description = "Maximum session duration in seconds"
  type        = number
  sensitive   = false

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Session duration must be between 3600 and 43200 seconds."
  }
}

variable "url" {
  type        = string
  description = "URL of identity provider"
  default     = "gitlab.com"
  sensitive   = false
}

variable "region" {
  default     = "eu-west-1"
  description = "AWS Region name."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Map of tags to be applied to all resources."
  type        = map(string)
  sensitive   = false
}
