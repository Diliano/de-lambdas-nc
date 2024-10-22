resource "aws_lambda_layer_version" "save_monster_lambda_layer" {
  filename   = "${path.module}/../save-monster-lambda-layer/save_monster_lambda_layer.zip"
  layer_name = "save-monster-lambda-layer"

  source_code_hash = filebase64sha256("${path.module}/../save-monster-lambda-layer/save_monster_lambda_layer.zip")

  compatible_runtimes = ["python3.12"]
}
