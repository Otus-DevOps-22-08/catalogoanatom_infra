terraform {
backend "s3" {
  endpoint   = "storage.yandexcloud.net"
  bucket     = "terraform-2"
  region     = "ru-central1"
  key        = "tfstate/terraform_state.tfstate"
  access_key = "YCAJEk47-PZ_hlO95-1sxzp-P"
  secret_key = "YCOidQJR8Pkd1pgmNf3Z9vuO9KLXm6isBpz6sLqM"

  skip_region_validation      = true
  skip_credentials_validation = true
}
}
