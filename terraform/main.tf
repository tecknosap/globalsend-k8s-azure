resource "azurerm_resource_group" "this" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "goclouddev"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_a2_v2"
    vnet_subnet_id = azurerm_subnet.this.id
    
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "10.1.0.0/16"  # must NOT overlap VNet/subnet
    dns_service_ip    = "10.1.0.10"    # within service_cidr
    #docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }
  node_resource_group = "aks-nodes-${var.resource_group_name}"
}


resource "azurerm_virtual_network" "this" {
    name                = var.vnet_name
    location            = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
    address_space       = var.address_space
}

resource "azurerm_subnet" "this" {
    name                 = var.subnet_name
    resource_group_name  = azurerm_resource_group.this.name
    virtual_network_name = azurerm_virtual_network.this.name
    address_prefixes     = [var.subnet_address_prefix]
}