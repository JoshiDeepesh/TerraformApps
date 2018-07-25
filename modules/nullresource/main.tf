resource "null_resource" "cluster"{
  #count = "${var.numofmachines}"
  count = "${var.enablekerberos == "false" ? var.numofmachines : 0}"
  provisioner "file"{
    source = "${path.cwd}/../../scripts/"
    destination = "/tmp/"

    connection {
      type = "ssh"
      user = "${var.dfsshuser}"
      host = "${element(var.myiplist, count.index)}"
      private_key = "${file("/tmp/putyourpemfilename.pem")}"

    }
  }

  provisioner "remote-exec" {

    inline = ["chmod +x /tmp/master_install.bash","/tmp/master_install.bash ${var.mydnslist[0]}"]
    connection {
      type = "ssh"
      user = "${var.dfsshuser}"
      host = "${element(var.myiplist, count.index)}"
      private_key = "${file("/tmp/putyourpemfilename.pem")}"
    }
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/reg_blueprint.bash","/tmp/reg_blueprint.bash ${join(" ",var.mydnslist)}"]
    connection {
      type = "ssh"
      user = "${var.dfsshuser}"
      host = "${var.myiplist[0]}"
      private_key = "${file("/tmp/putyourpemfilename.pem")}"
    }
  }

  provisioner "remote-exec" {

    inline = ["chmod +x /tmp/waitfordir.bash","/tmp/waitfordir.bash"]
    connection {
      type = "ssh"
      user = "${var.dfsshuser}"
      host = "${var.myiplist[1]}"
      private_key = "${file("/tmp/putyourpemfilename.pem")}"
    }

  }
}


