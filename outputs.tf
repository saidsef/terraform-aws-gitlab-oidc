output "role_id" {
  value       = aws_iam_role.role[0].id
  sensitive   = false
  description = "AWS IAM role ID"
}

output "role_arn" {
  value       = aws_iam_role.role[0].arn
  sensitive   = false
  description = "AWS IAM role ARN"
}

output "repositories" {
  value       = local.repositories_branches
  sensitive   = false
  description = "List of GitLab repositories and branches"
}

output "thumbprint" {
  value       = [for fingerprint in data.tls_certificate.provider.certificates : fingerprint.sha1_fingerprint]
  sensitive   = false
  description = "GitLab certificates thumbprints"
}
