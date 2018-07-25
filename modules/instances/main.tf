resource "aws_instance" "example"{
  count = "${var.numofmachines}"
  ami = "${var.machine_image}"
  instance_type = "${var.machine_type}"
  key_name = "putyourpemfilename"
  subnet_id = "${var.cls_subnet}"
  vpc_security_group_ids = "${var.sec_grp_id}"
  tags {
    Name = "ForkByTerraform"
    Owner = "qe@test.com"
  }
}
