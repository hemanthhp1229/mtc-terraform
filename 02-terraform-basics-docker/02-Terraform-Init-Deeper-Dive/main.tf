terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.0"
    }
  }
}

provider "docker" {}


resource "docker_image" "mynodered_image" {
  name = "nodered/node-red"
}

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.mynodered_image.image_id
  ports {
    internal = 1880
    external = 1880
    protocol = "tcp"
  }
}