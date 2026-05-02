locals {
  metric_models_bucket_name = "metric-models"
}

module "metric_models_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.0"

  bucket = local.metric_models_bucket_name

  server_side_encryption_configuration = {
    rule = [
      {
        apply_server_side_encryption_by_default = {
          sse_algorithm = "AES256"
        }
      },
    ]
  }
}

module "github_metric_models" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.52"

  name = "github-metric-models"
  subjects = [
    "square-intelligence/metric-models"
  ]
  policies = {}
}

data "aws_iam_policy_document" "metric_models_s3" {
  statement {
    sid       = "ListBucket"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [module.metric_models_bucket.s3_bucket_arn]
  }

  statement {
    sid    = "ObjectRW"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:HeadObject",
    ]
    resources = ["${module.metric_models_bucket.s3_bucket_arn}/*"]
  }
}

resource "aws_iam_role_policy" "metric_models_s3" {
  name   = "metric-models-s3"
  role   = module.github_metric_models.name
  policy = data.aws_iam_policy_document.metric_models_s3.json
}
