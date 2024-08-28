variable "location" {
  description = "azure location"
}

variable "storage_account_tfstate" {
  description = "variable for tfstate storage account"

}

variable "resourcegroupname" {
  description = "RG name"
}

variable "address" {
  description = "vnet address"
  type        = list(string)
}
variable "tags" {
description = "name of RG tag" 
type = map(string)
}