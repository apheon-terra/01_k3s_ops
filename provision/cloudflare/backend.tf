terraform {
  #  experiments = [module_variable_optional_attrs]
  # backend "remote" {
  #   organization = "alpheon"
  #   workspaces {
  #     name = "03_tf_apps"
  #   }
  #   hostname = "app.terraform.io"
  #   token = ""

  # }

  backend "local" {} #because of the sops file
}
