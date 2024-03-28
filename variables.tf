provider "azurerm" {
    features {}
    subscription_id = "${var.subscription_id}"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
    tenant_id = "${var.tenant_id}"
}

variable "subscription_id" {
  description = "Enter Subscription id"
}

variable "client_id" {
  description = "Enter the client id"
}

variable "client_secret" {
  description = "Enter the client Password"
}

variable "tenant_id" {
  description = "Enter the tennant Id"
}

variable "resource_group_name" {
  default = "terraTestRg"
}

variable "prefix" {
  default = "cH"
}

