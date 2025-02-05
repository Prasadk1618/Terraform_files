output "ip" {
  value = aws_instance.myec2.public_ip
}
output "state" {
  value = aws_instance.myec2.instance_state
}
output "inst_id" {
   value = aws_instance.myec2.id
}
