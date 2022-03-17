provider "aws" {
  region = "us-east-1"
  #   version                     = "3.45.0"
  profile                     = "localstack"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    elb            = "http://localhost:4566"
    ec2            = "http://localhost:4566"
  }
}


# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "cds"
#   cidr = "10.0.0.0/16"

#   azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = false

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }


