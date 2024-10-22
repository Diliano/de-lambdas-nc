/*
IAM resources for dice_roll lambda
*/

resource "aws_iam_role" "dice_roll_lambda_role" {
  name               = "dice-roll-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_dice_roll_lambda_role.json
}

resource "aws_iam_policy" "dice_roll_lambda_policy" {
  name   = "dice-roll-lambda-policy"
  policy = data.aws_iam_policy_document.dice_roll_lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "dice_roll_lambda_policy_attach" {
  role       = aws_iam_role.dice_roll_lambda_role.name
  policy_arn = aws_iam_policy.dice_roll_lambda_policy.arn
}

resource "aws_iam_policy" "dice_roll_lambda_logging_policy" {
  name   = "dice-roll-lambda-logging-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.dice_roll_lambda_logging_policy.json
}

resource "aws_iam_role_policy_attachment" "dice_roll_lambda_logging_policy_attach" {
  role       = aws_iam_role.dice_roll_lambda_role.name
  policy_arn = aws_iam_policy.dice_roll_lambda_logging_policy.arn
}

/*
IAM resources for save_monster lambda
*/

resource "aws_iam_role" "save_monster_lambda_role" {
  name               = "save-monster-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_save_monster_lambda_role.json
}

resource "aws_iam_policy" "save_monster_lambda_policy" {
  name   = "save-monster-lambda-policy"
  policy = data.aws_iam_policy_document.save_monster_lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "save_monster_lambda_policy_attach" {
  role       = aws_iam_role.save_monster_lambda_role.name
  policy_arn = aws_iam_policy.save_monster_lambda_policy.arn
}

resource "aws_iam_policy" "save_monster_lambda_logging_policy" {
  name   = "save-monster-lambda-logging-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.save_monster_lambda_logging_policy.json
}

resource "aws_iam_role_policy_attachment" "save_monster_lambda_logging_policy_attach" {
  role       = aws_iam_role.save_monster_lambda_role.name
  policy_arn = aws_iam_policy.save_monster_lambda_logging_policy.arn
}
