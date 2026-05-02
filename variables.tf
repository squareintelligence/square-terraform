variable "aws_region" {
  type        = string
  description = "AWS region for resources."
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Short name prefix for resource naming."
  default     = "square"
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "Repository name (without org)."
}

variable "default_tags" {
  type        = map(string)
  description = "Tags applied to all supported resources."
  default     = {}
}

variable "github_actions_managed_policy_arns" {
  type        = list(string)
  description = "Managed policies attached to the GitHub Actions OIDC role (e.g. Terraform in CI)."
  default     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}
