resource "aws_s3_bucket" "project-s3-bucket" {
  bucket = var.bucket_name
  #force_destroy = true   # "This option is not recomended"
}

resource "aws_s3_bucket_policy" "allow_pub_access" {
  bucket = aws_s3_bucket.project-s3-bucket.id
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
   }
   EOF
}

resource "aws_s3_bucket_public_access_block" "public-acl" {
   block_public_acls = false
   block_public_policy = false
   bucket = aws_s3_bucket.project-s3-bucket.id
}


resource "aws_s3_bucket_versioning" "name" {
   bucket = aws_s3_bucket.project-s3-bucket.id 
   versioning_configuration {
     status = "Enabled"
   }  
}

# S3 static website config
resource "aws_s3_bucket_website_configuration" "example" {
    bucket = aws_s3_bucket.project-s3-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

