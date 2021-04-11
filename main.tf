
# declare provider with environment variable (using user profile)
 
provider "aws" {
    region = "eu-west-1"
    profile = "sawa"
}


# calling the group module 

module "users_module" {
    source = "./users_module"
    username-dev = var.username-dev
    
}
