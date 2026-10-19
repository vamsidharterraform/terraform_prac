# provider "aws" {
#   region = "us-east-1"

#   default_tags {
#     tags = {
#       Project     = "Prometheus-Temp-Loki"
#       Environment = "dev"
#       ManagedBy   = "Terraform"
#     }
#   }
# }

provider "aws" {

    region = "us-east-1"
    default_tags {
      tags = {
        Project = "ec2"
        Environment = "dev"
      }
    }
}