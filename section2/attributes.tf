# provider "aws" {
#   region  = "ap-southeast-2"
#   version = "~> 3.0"
# }

# resource "aws_eip" "eip" {
#   vpc = true
# }

# output "eipOut" {
#   value = aws_eip.eip.public_ip
# }

# resource "aws_s3_bucket" "s3BucketUsingTF" {
#   bucket = "byrash-s3-bucket-using-tf"
# }

# output "s3Bucketout" {
#   value = aws_s3_bucket.s3BucketUsingTF.bucket_domain_name
# }
