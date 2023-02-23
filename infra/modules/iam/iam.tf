resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "codepipeline_policy" {
  name   = "codepipeline-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:GetBucketAcl"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetBucketLocation",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:GetBucketAcl",
          "s3:PutObjectAcl"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::artifactPokETL-bucket/*"
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Action = [
          "ecs:Describe*",
          "ecs:List*",
          "ecs:CreateService",
          "ecs:UpdateService",
          "ecs:DeleteService",
          "ecs:CreateTaskSet",
          "ecs:UpdateTaskSet",
          "ecs:DeleteTaskSet"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy" {
  policy_arn = aws_iam_policy.codepipeline_policy.arn
  role       = aws_iam_role.codepipeline_role.name
  depends_on = [aws_iam_role.codepipeline_role]
}
