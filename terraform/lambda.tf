resource "aws_lambda_function" "dice_roll_lambda" {
  filename      = data.archive_file.dice_roll_lambda.output_path
  function_name = var.dice_roll_lambda_function_name
  role          = aws_iam_role.dice_roll_lambda_role.arn
  handler       = "dice_roll.lambda_handler"

  source_code_hash = data.archive_file.dice_roll_lambda.output_base64sha256

  runtime = "python3.12"
}

resource "aws_lambda_function" "save_monster_lambda" {
  filename      = data.archive_file.save_monster_lambda.output_path
  function_name = var.save_monster_lambda_function_name
  role          = aws_iam_role.save_monster_lambda_role.arn
  handler       = "save_monster.lambda_handler"

  source_code_hash = data.archive_file.save_monster_lambda.output_base64sha256

  runtime = "python3.12"

  layers = [aws_lambda_layer_version.save_monster_lambda_layer.arn]
}
