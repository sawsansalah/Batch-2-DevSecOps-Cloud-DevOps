output "public_ip" {
    description = "public ip"
    value = aws_instance.my_ec2.public_ip

}

output "private_IP" {
    description = "private ip"
    value = aws_instance.db.private_ip
  
}
output "instaance_id" {
    description = "id of instance"
    value = aws_instance.my_ec2.id
  
}