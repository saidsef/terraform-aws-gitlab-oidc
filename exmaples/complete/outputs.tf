output "role_arn" {
  description = "AWS action role ARN"
  sensitive   = false
  value       = module.gitlab_oidc.role_arn
}

output "thumbprint" {
  description = "GitLab certificates thumbprint"
  value       = module.gitlab_oidc.thumbprint
  sensitive   = false
}