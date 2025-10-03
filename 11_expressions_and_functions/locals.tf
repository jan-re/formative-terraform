locals {
  math       = 2 * 2
  equality   = 2 != 2
  comparison = 2 < 1
  logical    = true || false
  negation   = !true
}

# Working with lists
locals {
  double_numbers = [for num in var.numbers_list : num * 2]

  even_numbers = [for num in var.numbers_list : num if num % 2 == 0]

  firstnames = [for v in var.object_list : v.firstname]

  fullnames = [for v in var.object_list : "${v.firstname} ${v.lastname}"]
}

# Working with maps
locals {
  doubles_map = { for key, value in var.numbers_map : key => value * 2 }

  even_map = { for key, value in var.numbers_map : key =>
    value * 2 if value % 2 == 0
  }
}

# Transformations
locals {
  users_map = { for v in var.users : v.username => v.role... }

  users_map2 = { for key, value in local.users_map : key => { roles = value } }

  usernames_from_map = [for key, value in local.users_map : key]
}
