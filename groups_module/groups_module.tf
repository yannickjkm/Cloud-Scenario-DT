



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


# ===========================
#      FINANCE DEPARTMENT
# ===========================


//  create FINANCE IAM Groups

resource "aws_iam_group" "finance-team" {
  name = "FINANCE"
}

output "finance-group" {
  value = aws_iam_group.finance-team.id
}


// create policies for FINANCE Group


resource "aws_iam_group_policy_attachment" "finance-team-policy" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AWSOrganizationsFullAccess", 
    "arn:aws:iam::aws:policy/job-function/Billing"
  ])

  group = aws_iam_group.finance-team.name
  policy_arn = each.value
}


# ===========================
#      SECURITY DEPARTMENT
# ===========================


//  create SECURITY IAM Groups

resource "aws_iam_group" "security-team" {
  name = "SECURITY"
}

output "security-group" {
  value = aws_iam_group.security-team.id
}

// create policies for FINANCE Group


resource "aws_iam_group_policy_attachment" "security-team-policy" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonGuardDutyFullAccess", 
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AWSSecurityHubFullAccess"

  ])

  group = aws_iam_group.security-team.name
  policy_arn = each.value
}