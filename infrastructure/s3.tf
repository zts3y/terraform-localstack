resource "aws_s3_bucket" "files" {
  bucket = "cds-files"

  tags = {
    "Name"        = "cds-files"
    "Environment" = "Dev"
  }
}

resource "aws_s3_object" "DemoFile" {
  bucket   = aws_s3_bucket.files.id
  key      = "demo.txt"
  source   = "./files/demo.txt"
  metadata = {}
  tags     = {}
}
# awslocal s3 ls s3://cds-files/
