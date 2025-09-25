resource "aws_iam_policy" "read_policy" {
  name   = "read_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_read_policy.json
}