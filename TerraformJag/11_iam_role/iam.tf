resource "aws_iam_role" "s3-mybucket-role" {
    name = "s3-mybucket-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowEC2AssumeRole",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile" {
    name = "s3-mybucket-role-instanceprofile"
    role = aws_iam_role.s3-mybucket-role.name
}

resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
    name = "s3-mybucket-role-policy"
    role = aws_iam_role.s3-mybucket-role.id
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3FullAccess",
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::jagawsdevopskibalti",
        "arn:aws:s3:::jagawsdevopskibalti/*"
      ]
    }
  ]
}
EOF
}





        
     

