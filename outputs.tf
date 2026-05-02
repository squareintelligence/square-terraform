output "metric_models_bucket_id" {
  value = module.metric_models_bucket.s3_bucket_id
}

output "metric_models_bucket_arn" {
  value = module.metric_models_bucket.s3_bucket_arn
}

output "github_metric_models_role_arn" {
  value       = module.github_metric_models.arn
  description = "S3-only OIDC role for metric-models bucket (not for running Terraform)."
}
