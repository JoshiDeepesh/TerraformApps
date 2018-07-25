variable "accesskey" {
  description = "Access key for connecting AWS"
}

variable "secretkey" {
  description = "Secret key for connecting AWS"
}

variable "machinecount" {
  description = "Number of Machines Required"
  default = 3
}

variable "machine_image" {
  description = "AMI to be used for creating clusters"
  default = ""
}

variable "machine_type" {
  description = "Size of machines in a cluster"
  default = "m3.xlarge"
}

variable "cls_subnet" {
  description = "Subnet to be used for cluster"
  default = ""
}

variable "enablekerberos" {
  default = "false"
}
