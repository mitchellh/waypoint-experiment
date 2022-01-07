project = "foo"

variable "name" {
  type = string
  default = configdynamic("null", { static_value = "foo" })
}

app "web" {
  build {
    use "docker" {}

    registry {
      use "docker" {
        image = "foo_${var.name}"
        tag   = "latest"
        local = true
      }
    }
  }

  deploy {
    use "docker" {
    }
  }
}
