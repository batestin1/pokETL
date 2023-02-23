resource "aws_dynamodb_table" "pokemon_table" {
  name           = "pokemon_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "name"

  attribute {
    name = "name"
    type = "S"
  }
  attribute {
    name = "generation"
    type = "S"
  }
  attribute {
    name = "level"
    type = "S"
  }
  attribute {
    name = "pokedex"
    type = "S"
  }
  attribute {
    name = "attack"
    type = "S"
  }
  attribute {
    name = "defense"
    type = "S"
  }
  attribute {
    name = "moves"
    type = "S"
  }
  attribute {
    name = "type"
    type = "S"
  }

  global_secondary_index {
    name               = "pokedex-index"
    hash_key           = "pokedex"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "type-index"
    hash_key           = "type"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "level-index"
    hash_key           = "level"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "generation-index"
    hash_key           = "generation"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "moves-index"
    hash_key           = "moves"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "attack-index"
    hash_key           = "attack"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  global_secondary_index {
    name               = "defense-index"
    hash_key           = "defense"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  tags = {
    Name = "pokemon_table"
  }
}
