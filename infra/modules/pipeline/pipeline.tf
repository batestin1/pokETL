module "iam" {
  source = "../iam"
}

module "s3" {
  source = "../s3"
}

resource "aws_codepipeline" "aws_pipeline" {
  name     = "pipelinePokETL"
  role_arn = module.iam.codepipeline_role_arn

  artifact_store {
    location = "artifactPokETL-bucket"
    type     = "S3"
  }

  provider {
    name   = "aws"
    region = "us-east-2"
  }

  stage {
    name = "ETL"

    action {
      name            = "GlueETL"
      category        = "Build"
      owner           = "AWS"
      provider        = "Glue"
      version         = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = ["GlueOutput"]

      configuration = {
        ScriptLocation = "s3://${module.s3.poketl_script_glue.bucket}/pypoketlglue.py"
        JobName        = "poketl"
        Timeout        = "2880"
      }
    }
  }

  stage {
    name = "Store"

    action {
      name            = "DynamoDBStore"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "DynamoDB"
      input_artifacts  = ["GlueOutput"]
      version         = "1"

      configuration = {
        Table           = "pokemon_table"
        Operation       = "PutItem"
        HashKey         = "name"
        ItemInputPath   = "output"
        ItemOutputPath  = "output"
        HashKeyType     = "S"
        RangeKeyType    = "S"
      }
    }
  }
}
