resource "aws_s3_bucket" "dice_rolls_bucket" {
  bucket = "dice-rolls-bucket-terraform-nc-2024"

  force_destroy = true
}
