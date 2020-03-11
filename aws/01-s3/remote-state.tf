data "terraform_remote_state" "random_string" {
  backend = "s3"
  config = {
    region         = "us-east-1"
    bucket         = "alc-tf-samples-state"
    key            = "public-samples/random.tfstate"
    dynamodb_table = "alc-tf-samples-state"
    encrypt        = "true"
  }
}
