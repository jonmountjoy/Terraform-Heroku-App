# Deploys a Heroku application using Terraform

* [Download and install Terraform](https://www.terraform.io/docs/providers/heroku/r/build.html)
* [Authorize and set local config vars](https://devcenter.heroku.com/articles/using-terraform-with-heroku#obtaining-an-authorization-token)
* Clone this repo, and `cd` into it
* Think of an app name.  Something like: `jonwashere1x`

Now, run:

* `terraform init`
* `terraform apply -var app_name=jonwashere1x`

The app will be deployed, and an add-on as well.

If you want to remove all the deployed resources, run:

* `terraform destory -var app_name=jonwasherex`

For more information, read [Using Terraform with Heroku](https://devcenter.heroku.com/articles/using-terraform-with-heroku)

