



# ===========================
#      DEV DEPARTMENT
# ===========================

//  create DEV IAM Groups

resource "aws_iam_group" "dev-team" {
  name = "DEV"
}

output "dev-group" {
  value = aws_iam_group.dev-team.id
}


// create policies for DEV Group


resource "aws_iam_group_policy_attachment" "dev-team-policy" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess", 
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  ])

  group = aws_iam_group.dev-team.name
  policy_arn = each.value
}



