terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
/*
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-2"
    region     = "ru-central1"
    key        = "tfstate/terraform_state.tfstate"
    access_key = "YCAJEk47-PZ_hlO95-1sxzp-P"
    secret_key = "YCOidQJR8Pkd1pgmNf3Z9vuO9KLXm6isBpz6sLqM"

    skip_region_validation      = true
    skip_credentials_validation = true
  }*/
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
