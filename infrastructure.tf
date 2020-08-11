provider "aws" {
  version = "~> 3.0"
  profile = "mastermnd"
  region  = "us-east-1"
}

#module "blog" {
#  source = "./blog"
#}

module "devInstances" {
  source = "./devInstances"
}

output "real_test" {
  value = devInstances.developmentServer[*].test_var
}

