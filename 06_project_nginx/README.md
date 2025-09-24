This project deploys an EC2 instance with an Nginx image.

This instance will have its own public IP that is rendered accessible for ports 80 and 443 via security groups. Everything is provisioned via Terraform, works out of the box.

Few other details:

- `locals.tf` is used to define tags in a single spot
- we're using `create_before_destroy` to assure continuous availability
- only ingress rules are defined