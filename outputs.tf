output "metric_models_bucket_id" {
  value = module.metric_models_bucket.s3_bucket_id
}

output "metric_models_bucket_arn" {
  value = module.metric_models_bucket.s3_bucket_arn
}

output "github_actions_role_arn" {
  value       = module.github_actions.arn
  description = "Assume role ARN for GitHub Actions OIDC (configure-aws-credentials)."
}
