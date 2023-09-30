data "aws_iam_policy_document" "base" {
  statement {
    actions = [
      "lambda:*EventSourceMapping*",
      "xray:*Group*",
      "xray:*SamplingRule*",
      "xray:*EncryptionConfig*"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "iam:PassRole"
    ]

    resources = [
      "arn:*:iam::*:role/*${var.repository_name}*"
    ]
  }

  statement {
    actions = [
      "logs:DescribeLogGroups"
    ]

    resources = [
      "arn:*:logs:*:*:log-group::log-stream:*"
    ]
  }

  statement {
    actions = [
      "lambda:*",
    ]

    resources = [
      "arn:*:lambda:*:*:function:*${var.repository_name}*",
      "arn:*:lambda:*:*:layer:*",
    ]
  }

  statement {
    actions = [
      "s3:List*",
      "s3:Get*",
      "s3:Describe*",
      "s3:Put*",
      "s3:Delete*",
      "cloudfront:CreateInvalidation",
    ]

    resources = [
      "arn:*:s3:::${var.repository_name}",
      "arn:*:s3:::${var.repository_name}/*",
      "arn:*:cloudfront::*:distribution/*",
    ]
  }

  statement {
    effect = "Deny"

    actions = [
      "s3:DeleteBucket",
      "s3:DeleteObjectVersion"
    ]

    resources = [
      "arn:*:s3:::${var.repository_name}",
      "arn:*:s3:::${var.repository_name}/*",
    ]
  }
}

resource "aws_iam_user" "user" {
  name = "${var.repository_name}-deployer"
}

resource "aws_iam_user_policy" "policy" {
  name   = "base-policy"
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.base.json
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user.name

  depends_on = [
    aws_iam_user_policy.policy
  ]
}

resource "aws_cloudfront_origin_access_identity" "identity" {}

resource "aws_iam_role" "lambda_edge" {
  name = "${var.repository_name}-lambda-edge"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "edgelambda.amazonaws.com",
            "lambda.amazonaws.com"
          ]
        }
      },
    ]
  })

  inline_policy {
    name = "base"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          Effect   = "Allow"
          Resource = "arn:aws:logs:*:*:*"
        },
      ]
    })
  }
}