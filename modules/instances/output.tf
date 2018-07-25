output "listofprdns" {
  value = "${join(" ",aws_instance.example.*.private_dns)}"
}

output "listofprips" {
  value = "${join(" ",aws_instance.example.*.private_ip)}"
}
