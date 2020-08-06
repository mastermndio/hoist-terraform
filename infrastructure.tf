provider "aws" {
  version = "~> 3.0"
  profile = "mastermnd"
  region  = "us-east-1"
}

# Create an S3 bucket with static hosting enabled
resource "aws_s3_bucket" "websiteBucket" {
  bucket = "hoist-media-blog-site"
  acl    = "public-read"
  policy = file("policy.json")

  tags = {
    Name        = "blog bucket"
    Environment = "Dev"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}

# Creates an EC2 instance for development
resource "aws_instance" "developmentServer" {
  count         = 2
  ami           = "ami-0ac80df6eff0e70b5"
  instance_type = "t3.micro"
  key_name      = "hoist"

  tags = {
    Name = "hoist-internal-development"
  }
}
