provider "aws" {
  region = "ap-south-1"  # Replace with your desired region
}


# Configuration of Public Bucket 1
resource "aws_s3_bucket" "public_bucket" {
  bucket = "overlord101-stagging"
}

resource "aws_s3_bucket_ownership_controls" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "public_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_bucket,
    aws_s3_bucket_public_access_block.public_bucket,
  ]
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "public_bucket" {
  bucket = "overlord101-stagging"
  key    = "index.html"
  source = "s3_buckets/index.html"
  acl = "public-read"
}



# Configuration of Public Bucket 2
resource "aws_s3_bucket" "public_bucket2" {
  bucket = "overlord101-backups"
}

resource "aws_s3_bucket_ownership_controls" "public_bucket2" {
  bucket = aws_s3_bucket.public_bucket2.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_bucket2" {
  bucket = aws_s3_bucket.public_bucket2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "public_bucket2" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_bucket2,
    aws_s3_bucket_public_access_block.public_bucket2,
  ]
  bucket = aws_s3_bucket.public_bucket2.id
  acl    = "public-read"
}

resource "aws_s3_object" "public_bucket2" {
  bucket = "overlord101-backups"
  key    = "passwd"
  source = "s3_buckets/passwd"
  acl = "public-read"
}




# Configuration of private bucket
resource "aws_s3_bucket" "private_Bucket" {
  bucket = "overlord101-production"
}

resource "aws_s3_bucket_ownership_controls" "private_Bucket" {
  bucket = aws_s3_bucket.private_Bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_Bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.private_Bucket]

  bucket = aws_s3_bucket.private_Bucket.id
  acl    = "private"
}
 


# Private Bucket 2 
resource "aws_s3_bucket" "private_Bucket2" {
  bucket = "overlord101-prod"
}

resource "aws_s3_bucket_ownership_controls" "private_Bucket2" {
  bucket = aws_s3_bucket.private_Bucket2.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_Bucket2" {
  depends_on = [aws_s3_bucket_ownership_controls.private_Bucket2]

  bucket = aws_s3_bucket.private_Bucket2.id
  acl    = "private"
}



# Private Bucket 3
resource "aws_s3_bucket" "private_Bucket3" {
  bucket = "overlord101-dev"
}

resource "aws_s3_bucket_ownership_controls" "private_Bucket3" {
  bucket = aws_s3_bucket.private_Bucket3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_Bucket3" {
  depends_on = [aws_s3_bucket_ownership_controls.private_Bucket3]

  bucket = aws_s3_bucket.private_Bucket3.id
  acl    = "private"
}