variable "machine_image" {
  description = "AMI to be used for creating clusters"
  default = ""
}

variable "sec_grp_id" {
  type = "list"
  description = "Your security group ID"
  default = [""]
}


variable "machine_type" {
  description = "Size of machines in a cluster"
  default = "m3.xlarge"
}

variable "cls_subnet" {
  description = "Subnet to be used for cluster"
  default = ""
}

variable "numofmachines" {
  default = 0
}
