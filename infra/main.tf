provider "aws" {
  region = var.region
}

module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
  stage          = var.stage
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source = "./modules/iam"
}

module "pipeline" {
  source = "./modules/pipeline"

  github_repository_owner = ""
  github_repository_name  = ""
  github_branch           = ""
  github_access_token     = var.github_access_token

  iam_role_arn       = module.iam.codepipeline_role_arn
  s3_bucket_name     = module.s3.poketl_script_glue_id
}

output "iam_role_arn" {
  value = module.iam.iam_role_arn
}


output "poketl_script_glue" {
  value = module.s3.poketl_script_glue.id
}

