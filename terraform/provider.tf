provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Lambda"
      Environment = "Dev"
      ManagedBy   = "Terraform"
      Repository  = "https://github.com/Diliano/de-lambdas"
      Owner       = "NC-DP"
    }
  }
}
