variable "attach_admin_policy" {
  default     = false
  description = "Attach AdministratorAccess policy"
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Attach ReadOnly policy"
  type        = bool
}

variable "create_oidc_provider" {
  default     = true
  description = "Create GitLab OIDC provider"
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Enable resource creation"
  type        = bool
}

variable "force_detach_policies" {
  default     = false
  description = "Force detach IAM policies"
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
  description = "List of GitLab repositories and refs"

  validation {
    condition     = alltrue([for repo in var.gitlab_repositories : length(repo.name) > 0])
    error_message = "Each GitLab repository must have a non-empty name."
  }
}

variable "iam_role_name" {
  default     = "gitlab-runner"
  description = "IAM role name"
  type        = string

  validation {
    condition     = length(var.iam_role_name) > 0
    error_message = "IAM role name must not be empty."
  }
}

variable "iam_role_path" {
  default     = "/"
  description = "IAM role path"
  type        = string
  sensitive   = false

  validation {
    condition     = length(var.iam_role_path) > 0
    error_message = "IAM role path must not be empty."
  }
}

variable "iam_role_permissions_boundary" {
  default     = ""
  description = "IAM role permissions boundary ARN"
  type        = string
  sensitive   = false
}

variable "iam_role_policy_arns" {
  default     = []
  description = "List of IAM policy ARNs"
  type        = list(string)
  sensitive   = false
}

variable "max_session_duration" {
  default     = 3600
  description = "Max session duration (seconds)"
  type        = number
  sensitive   = false

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Session duration must be between 3600 and 43200 seconds."
  }
}

variable "url" {
  type        = string
  description = "Identity provider URL"
  default     = "gitlab.com"
  sensitive   = false

  validation {
    condition     = can(regex("^https?://", var.url))
    error_message = "URL must be a valid HTTP or HTTPS URL."
  }
}

variable "tags" {
  default     = {}
  description = "Resource tags"
  type        = map(string)
  sensitive   = false
}
