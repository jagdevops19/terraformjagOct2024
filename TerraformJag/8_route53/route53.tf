#resource "aws_route53_zone" "jagawsdevops" {
resource "aws_route53_zone" "jagawsdevops" {
   ##FYI-it will be unrachable meanwhile:)
   name = "jagawsdevops.com"
}
resource "aws_route53_record" "server1-record" {
   zone_id = aws_route53_zone.jagawsdevops.zone_id
   #zone_id = "${aws_route53_zone.jagawsdevops.zone_id}"
   name = "server1.jagawsdevops"
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "www-record" {
   #zone_id = "${aws_route53_zone.jagawsdevops.zone_id}"
   zone_id = aws_route53_zone.jagawsdevops.zone_id
   name = "www.jagawsdevops"
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "mail1-record" {
   #zone_id = "${aws_route53_zone.jagawsdevops.zone_id}"
   zone_id = aws_route53_zone.jagawsdevops.zone_id
   name = "jagawsdevops"
   type = "MX"
   ttl = "300"
   records = [
     "1 aspmx.l.google.com.",
     "5 alt1.aspmx.l.google.com.",
     "5 alt2.aspmx.l.google.com.",
     "10 aspmx2.googlemail.com.",
     "10 aspmx3.googlemail.com."
   ]
}

output "ns-servers" {
   #value = "${aws_route53_zone.jagawsdevops.name_servers}"
   value = aws_route53_zone.jagawsdevops.name_servers
}
