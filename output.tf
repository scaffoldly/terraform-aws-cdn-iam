output "deployer_arn" {
  value       = aws_iam_user.user.arn
  description = "The ARN of the user that can be used for deploys"
}

output "deployer_access_key" {
  value       = aws_iam_access_key.access_key.id
  description = "The AWS Access Key that can be used for deploys"
}

output "deployer_secret_key" {
  value       = aws_iam_access_key.access_key.secret
  sensitive   = true
  description = "The AWS Secret Key that can be used for deploys"
}

output "cloudfront_access_identity_arn" {
  value       = aws_cloudfront_origin_access_identity.identity.iam_arn
  description = "The CloudFront S3 access identity"
}

output "cloudfront_access_identity_path" {
  value       = aws_cloudfront_origin_access_identity.identity.cloudfront_access_identity_path
  description = "The CloudFront S3 access identity"
}

output "lambd_aedge_role_arn" {
  value       = aws_iam_role.lambda_edge.arn
  description = "The AWS IAM Role that can be used for Lambda@Edge"
}
