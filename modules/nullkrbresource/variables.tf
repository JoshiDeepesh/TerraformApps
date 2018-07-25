variable "myiplist" {
  type = "list"
  default = []
}

variable "mydnslist" {
  type = "list"
  default = []
}

variable "dfsshuser" {
  default = "root"
}

variable "numofmachines" {
  default = 0
}

variable "enablekerberos" {
  default = "false"
}