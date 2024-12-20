/*
Data block for AWS identity
*/

data "aws_caller_identity" "current" {}

/*
Data blocks for dice_roll lambda
*/

data "aws_iam_policy_document" "assume_dice_roll_lambda_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "dice_roll_lambda_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.dnd_bucket.arn}/*"]
  }
}

data "archive_file" "dice_roll_lambda" {
  type        = "zip"
  source_file = "${path.module}/../src/dice-roll/dice_roll.py"
  output_path = "${path.module}/../src/dice-roll/dice_roll.zip"
}

data "aws_iam_policy_document" "dice_roll_lambda_logging_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.dice_roll_lambda_function_name}",
      "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.dice_roll_lambda_function_name}:*",
    ]
  }
}

/*
Data blocks for save_monster lambda
*/

data "aws_iam_policy_document" "assume_save_monster_lambda_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "save_monster_lambda_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.dnd_bucket.arn}/*"]
  }
}

data "archive_file" "save_monster_lambda" {
  type        = "zip"
  source_file = "${path.module}/../src/save-monster/save_monster.py"
  output_path = "${path.module}/../src/save-monster/save_monster.zip"
}

data "aws_iam_policy_document" "save_monster_lambda_logging_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.save_monster_lambda_function_name}",
      "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.save_monster_lambda_function_name}:*",
    ]
  }
}
