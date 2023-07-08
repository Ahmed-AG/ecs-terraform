
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Locals for ease of use

#locals {
#    account_id = data.aws_caller_identity.current.account_id
#}

#locals {
#    region = data.aws_region.current.name
#}
