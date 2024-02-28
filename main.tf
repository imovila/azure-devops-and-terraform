provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.93.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf_rg_blobstore"
    storage_account_name = "tfstorageimovila"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "tf_test" {
  name     = "tfmainrg"
  location = "canadaeast"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name

  ip_address_type = "Public"
  dns_name_label  = "imovilawa"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "imovila/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }
}
