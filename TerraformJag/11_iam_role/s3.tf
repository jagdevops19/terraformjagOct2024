resource "aaws_s3_bucket_acl" "b" {
    bucket = var.MYBUCKETNAME
    acl    = "private"

    tags = {
        Name = var.MYBUCKETNAME
    }
}
