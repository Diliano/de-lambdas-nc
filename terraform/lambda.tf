resource "aws_lambda_function" "dice_roll_lambda" {
  filename      = data.archive_file.dice_roll_lambda.output_path
  function_name = var.dice_roll_lambda_function_name
  role          = aws_iam_role.dice_roll_lambda_role.arn
  handler       = "dice_roll.lambda_handler"

  source_code_hash = data.archive_file.dice_roll_lambda.output_base64sha256

  runtime = "python3.12"
}
