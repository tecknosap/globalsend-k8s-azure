# General
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "gocloudops-dev-rg"
}

variable "location" {
  description = "The location of the resources"
  type        = string
    default     = "canadacentral"
}


# AKS
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default = "gocloudops-dev-aks-cluster"
}


# vnet and subnet
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default = "gocloudops-dev-vnet"

}

variable "address_space" { 
  description = "The address space for the virtual network"
  type        = list(string)
  default = [ "10.1.0.0/16" ]
  
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
    default     = "gocloudops-dev-subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.1.0.0/24"
}
    
variable "subscription_id" {
  description = "The ID of the Azure subscription"
  type        = string
  default = "45f251e8-d84d-4b8e-ac63-77eef4482127"
}
