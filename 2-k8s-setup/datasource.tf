data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../1-vpc-setup/terraform.tfstate"
  }
}
