# The *.auto.tfvars files are automatically loaded by Terraform when it runs.
# The values in the *.auto.tfvars files override the values in the terraform.tfvars file. 
ec2_volume_config = {
  size = 5
  type = "gp3"
}
