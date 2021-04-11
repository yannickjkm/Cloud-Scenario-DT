

// Call the Group module

module "groups_module" {
    source = "../groups_module"
}


# ===========================
#      DEV DEPARTMENT
# ===========================

// call the DEV variable username

variable "username-dev" {}


// create DEV IAM users

resource "aws_iam_user" "dev-users" {
  count = length(var.username-dev)
  name = element(var.username-dev, count.index)
  

  tags = {
    tag-key = "DEV-TEAM"
  }
}

// Create access key for DEV users

resource "aws_iam_access_key" "dev-users" {
  count = length(var.username-dev)                          # the count parameter is used to count the number of users created.
  user = aws_iam_user.dev-users.*.name[count.index]
}

// adding users to the DEV group

resource "aws_iam_user_group_membership" "members-dev" {
  count = length(var.username-dev)
  user = aws_iam_user.dev-users.*.name[count.index]

  groups = [
    module.groups_module.dev-group,      # dev-group: output from the group module
  ]
}


# ===========================
#     FINANCE DEPARTMENT
# ===========================


# ===========================
#     SECURITY DEPARTMENT
# ===========================