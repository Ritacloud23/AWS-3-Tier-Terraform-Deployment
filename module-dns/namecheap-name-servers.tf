# --------------------------------------------------------
# Namecheap DNS – DISABLED to avoid overwriting nameservers
# Manage nameservers in Namecheap UI using the NS from
# aws_route53_zone.r53_zone.name_servers
# --------------------------------------------------------
# resource "namecheap_domain_records" "my-domain2-com" {
#   domain = var.domain_name
#   mode   = "OVERWRITE" // Warning: this will remove all manually set records
#
#   nameservers = aws_route53_zone.r53_zone.name_servers
#   depends_on  = [aws_route53_zone.r53_zone]
# }
