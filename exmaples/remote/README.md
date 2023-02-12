## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gitlab_oidc"></a> [gitlab\_oidc](#module\_gitlab\_oidc) | saidsef/gitlab-oidc/aws | >= 1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS Region name | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | AWS action role ARN |
| <a name="output_thumbprint"></a> [thumbprint](#output\_thumbprint) | GitLab certificates thumbprint |
