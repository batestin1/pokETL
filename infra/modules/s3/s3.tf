resource "aws_s3_bucket" "pokeetl_bucket" {
  bucket = var.s3_bucket_name
  
  tags = {
    Environment = var.stage
    Project     = "pokeetl"
  }
  
  // Adiciona permissões totais
  acl = "private"
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "poketl_script_glue" {
  bucket = "poketl-script-glue"

  tags = {
    Environment = var.stage
    Project     = "pokeetl"
  }

  acl = "private"

  lifecycle {
    prevent_destroy = false
  }
}

