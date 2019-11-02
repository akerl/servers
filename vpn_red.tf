output "red-vpn-address" {
  value = "${module.red-vpn.ip_address}"
}

module "red-vpn" {
  source         = "armorfret/wireguard/linode"
  version        = "0.1.0"
  name           = "red"
  ssh_keys       = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGJ8nnGTRnVJR6Sz6lnYdRchw2Z4S9DFOKTHuJBnMYBS"]
  region         = "us-east"
  stackscript_id = "${module.stackscript.stackscript_id}"
  image_id       = "${var.image_id}"
  users          = ["szeth", "lift", "jasnah", "kaladin"]
  type           = "g6-standard-1"
}

resource "linode_domain_record" "red" {
  domain_id   = "${linode_domain.wg.id}"
  name        = "red"
  record_type = "A"
  target      = "${module.red-vpn.ip_address}"
}