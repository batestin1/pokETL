resource "aws_glue_job" "job1" {
  name        = "job1"
  description = "This is job 1"
  role_arn    = aws_iam_role.glue_role.arn

  command {
    name        = "glueetl"
    script_location = "s3://my-bucket/glue-script.py"
  }

  default_arguments = {
    "--job-language" = "python"
  }

  connections = ["my-redshift-connection"]

  allocated_capacity = 10

  timeout = 60

  max_retries = 1

  execution_property {
    max_concurrent_runs = 1
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_glue_job" "job2" {
  name        = "job2"
  description = "This is job 2"
  role_arn    = aws_iam_role.glue_role.arn

  command {
    name        = "glueetl"
    script_location = "s3://my-bucket/glue-script.py"
  }

  default_arguments = {
    "--job-language" = "python"
  }

  connections = ["my-redshift-connection"]

  allocated_capacity = 10

  timeout = 60

  max_retries = 1

  execution_property {
    max_concurrent_runs = 1
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_glue_job" "job3" {
  name        = "job3"
  description = "This is job 3"
  role_arn    = aws_iam_role.glue_role.arn

  command {
    name        = "glueetl"
    script_location = "s3://my-bucket/glue-script.py"
  }

  default_arguments = {
    "--job-language" = "python"
  }

  connections = ["my-redshift-connection"]

  allocated_capacity = 10

  timeout = 60

  max_retries = 1

  execution_property {
    max_concurrent_runs = 1
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

