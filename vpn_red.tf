module "red-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "red"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-central"
  image_id = "${module.image.image_id}"

  users = ["alfa", "beta"]
}
