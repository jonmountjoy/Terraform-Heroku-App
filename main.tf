provider "heroku" {
  version = "~> 2.0"
}

variable "app_name" {
  description = "Name of the Heroku app provisioned as an example"
}

# A Heroku Application resource
resource "heroku_app" "example" {
  name   = "${var.app_name}"
  region = "us"
}

# Build code & release to the app, pointing to our Node getting started app
resource "heroku_build" "example" {
  app = "${heroku_app.example.name}"

  source = {
    url = "https://github.com/heroku/node-js-getting-started/archive/1.tar.gz"
    version = "1"
  }
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "example" {
  app        = "${heroku_app.example.name}"
  type       = "web"
  quantity   = 1
  size       = "Standard-1x"
  depends_on = ["heroku_build.example"]
}

# Provision an add-on
resource "heroku_addon" "papertrail_example" {
  app  = "${heroku_app.example.name}"
  plan = "papertrail:choklad"
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}

