# Bucket for monitoring the team
module "report_bucket" {
  source = "../modules/"
  bucket_name = "ziyotek-daler-ter-module-lab-1-copy"
}


# Bucket for monitoring ops team
module "datadog_bucket" {
  source = "../modules/"
  bucket_name = "ziyotek-daler-ter-module-lab-1-datadog"
}

# Bucket for monitoring developer team
module "website_bucket" {
  source = "../modules/"
  bucket_name = "ziyotek-daler-ter-module-lab-1-website"
}



# Provider block
provider "aws" {
  region = "us-east-1"
}

