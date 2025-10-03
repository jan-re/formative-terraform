locals {
  name = "Lauro Müller"
  age  = 15
  my_object = {
    key1 = 10
    key2 = "my_value"
  }
}

output "func_startswith" {
  value = startswith(lower(local.name), "john")
}

output "func_pow" {
  value = pow(local.age, 2)
}

output "func_yamldecode" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name
}

output "func_jsonencode" {
  value = jsonencode(local.my_object)
}
