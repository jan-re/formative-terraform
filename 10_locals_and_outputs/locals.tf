locals {
  ec2_volume_config = {
    size = 10
    type = "gp3"
  }

  ec2_instance_type = "t3.micro"

  project       = "10-terraform-course-locals"
  project_owner = "jan-re"
  cost_center   = "emea-east"
  managed_by    = "jan-re"
}


locals {
  common_tags = {
    project       = local.project
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
  }
}
