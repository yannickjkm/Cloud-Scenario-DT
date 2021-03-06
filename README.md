# Cloud-Scenario-DT

TASKS:

* Root & Child accounts:
    
    As I don't have access to a multi-account structure, I want to explain how this scenario can be achieved with a multi-account structure.

    Steps:

    1) I will first create the root account, then create IAM users with specific roles.
    2) I will create 3 other AWS accounts, one for the DEV team, one for the SECURITY team and one for the FINANCE team.
    3) Create a role in each of the 3 accounts (DEV, FINANCE, SECURITY) that users created in the root account will assume role from.
    4) Add a trust relation between the root account and DEV, the root account and FINANCE and the root account and SECURITY.
    5) Make sure that the users created for the DEV team in the root account can assume the role to only access the AWS DEV account, apply the same for the 2 other department.

* How the security and finance team will have visibility and relevant alerting on AWS activity:

    To achieve that I provided permissions to the security team to cloudwatch, cloudtrail and other additional services.
    I gave the fiance team access to AWS Organizations and billing.

* IAM structure:

    I created users and associated them to their respective groups. On each group I added the needed policies.

* How you might want to make, version, police or revert configuration changes in future :

    I used version control (git and github) and created tags that can be used for version and to police and revert configuration changes.


WORK COMPLETED:

    With access to just one AWS account, below are the steps used to complete the tasks:

    1) Created an IAM user with full admin access and programmatic access.
    2) Configured the AWS environment variables (with a user profile) on my local machine via AWS CLI  
    3) Used Terraform to create users, groups and policies.
    4) Created 3 git tags version, one tag for each department.
