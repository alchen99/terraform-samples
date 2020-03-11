data "terraform_remote_state" "random_string" {
  backend = "s3"
  config = {
    region         = "us-west-2"
    bucket         = "armory-alc-state"
    key            = "terraform/public-samples/random.tfstate"
    dynamodb_table = "armory-alc-state-lock"
    encrypt        = "true"
  }
}
