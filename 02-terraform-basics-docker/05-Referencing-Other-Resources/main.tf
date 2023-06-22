terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


provider "docker" {}

# download nodered image

resource "docker_image" "nodered_image" {
  name = "nodered/node-red"
}

# start the container

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.image_id
  ports {
    internal = 1880
    external = 1880
  }
}

# output "IP-address" {
#   value       = docker_container.nodered_container.ip_address
#   description = "The IP addr of the container"
# }

output "container_id" {
  value = docker_container.nodered_container.id
}
