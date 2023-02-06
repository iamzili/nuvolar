resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-nuvolar"

    object_lock_enabled = true

    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.terraform-state.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform-state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}