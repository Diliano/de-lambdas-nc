variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "dice_roll_lambda_function_name" {
  type    = string
  default = "dice_roll_lambda"
}

variable "save_monster_lambda_function_name" {
  type    = string
  default = "save_monster_lambda"
}
