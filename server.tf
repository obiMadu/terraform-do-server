#create gate-vpc
resource "digitalocean_vpc" "server_vpc" {
  name     = "server-vpc"
  region   = var.do_region
  ip_range = "10.10.10.0/24"
}

#create gate droplet
resource "digitalocean_droplet" "server" {
  name     = "server"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-22-04-x64"
  region   = var.do_region
  vpc_uuid = digitalocean_vpc.server_vpc.id
}