# This file is automatically loaded by Terraform.
# If its name were changed to, for example, dev.terraform.tfvars, it would not be loaded automatically.
# In that case, it would have to be passed as a -var-file="dev.terraform.tfvars" arg.

# In this project, the values below will not be used, but instead will be overwritte by file prod.auto.tfvars
ec2_volume_config = {
  size = 10
  type = "gp3"
}
