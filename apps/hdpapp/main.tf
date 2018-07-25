provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region     = "us-east-1"
}

module "instance" {
  source = "modules/instances"
  numofmachines = "${var.machinecount}"
  machine_image = "${var.machine_image}"
  machine_type =  "${var.machine_type}"
  cls_subnet = "${var.cls_subnet}"
}

module "nullresource"{
  source = "modules/nullresource"
  numofmachines = "${var.machinecount}"
  enablekerberos = "${var.enablekerberos}"
  myiplist = "${module.instance.listofprips}"
  mydnslist = "${module.instance.listofprdns}"
}

module "nullkrbresource"{
  source = "modules/nullkrbresource"
  numofmachines = "${var.machinecount}"
  enablekerberos = "${var.enablekerberos}"
  myiplist = "${module.instance.listofprips}"
  mydnslist = "${module.instance.listofprdns}"
}
