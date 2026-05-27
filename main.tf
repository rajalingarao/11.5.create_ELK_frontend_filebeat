resource "aws_instance" "ec2_instance" {
    ami           = data.aws_ami.rhel_info.id
    instance_type = var.ec2_instance.instance_type
    vpc_security_group_ids = [var.allow_everything]
    root_block_device {
        volume_type           = "gp3"
        volume_size           = 100
        delete_on_termination = true
    }
    user_data = file("${path.module}/Filebeat.sh")

    tags = {
        Name = "ELK_Frontend_Filebeat"
    }
}
resource "aws_route53_record" "elk_r53" {
    zone_id = var.zone_id
    name    = "filebeat.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.ec2_instance.public_ip]
    allow_overwrite = true
}
