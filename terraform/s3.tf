resource "aws_s3_bucket" "dnd_bucket" {
  bucket = "dnd-bucket-terraform-nc-2024"

  force_destroy = true
}
