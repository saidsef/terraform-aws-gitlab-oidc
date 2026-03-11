output "role_id" {
  value       = var.enabled ? aws_iam_role.role[0].id : null
  sensitive   = false
  description = "The ID of the AWS IAM role."
}

output "role_arn" {
  value       = var.enabled ? aws_iam_role.role[0].arn : null
  sensitive   = false
  description = "The ARN of the AWS IAM role."
}

output "repositories" {
  value       = var.enabled ? local.repositories_refs : []
  sensitive   = false
  description = "A list of GitLab repositories and their references."
}

output "thumbprint" {
  value       = var.enabled ? [for fingerprint in data.tls_certificate.provider.certificates : fingerprint.sha1_fingerprint] : []
  sensitive   = false
  description = "Thumbprints of GitLab certificates."
}
