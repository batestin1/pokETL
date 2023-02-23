variable "region" {
  default = "us-east-2"
}

variable "access_key" {
    default = ""
}

variable "secret_key" {
    default = ""
}

variable "glue_job_name" {
  default = "job_pokemon_etl"
}

variable "s3_bucket_name" {
  default = "etl-pokeetl-bucket"
}

variable "dynamodb_table_name" {
  default = "pokemonDB"
}

variable "github_repository_owner" {
  default = ""
}

variable "github_repository_name" {
  default = ""
}

variable "github_branch" {
  description = "The name of the branch to use for deploying the code."
  default = "develop"
}

variable "github_access_token" {
    default = ""
}

variable "stage" {
  type    = string
  default = "dev"
}