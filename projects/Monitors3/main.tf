module "monitoring_bucket" {
  source = "../s3/"
}

module "report_bucket" {
  source = "../s3/"
  bucket_name = "my-s3-bucket-for-project-daler21-monitor"
}

module "jenkins_bucket" {
  source = "../s3/"
  bucket_name = "my-s3-bucket-for-project-daler21-jenkins"
}


module "terraform_bucket" {
  source = "../s3/"
  bucket_name = "my-s3-bucket-for-project-daler21-terraform"
}


