module "s3_bucket" {
  source = "git@github.com:alchen99/terraform-aws-s3-bucket.git"

  create_bucket = var.create_s3_bucket

  bucket = local.s3_bucket_name_local
  region = var.region
  acl    = "private"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule  = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    env   = var.env
    owner = var.owner
  }
}

data "aws_s3_bucket" "selected" {
  depends_on = [ module.s3_bucket ]

  bucket = local.s3_bucket_name_local
}
