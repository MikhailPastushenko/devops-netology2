variable "yc_token" {
  type = string
}

variable "yc_cloudid" {
  type = string
}

variable "yc_folderid" {
  type = string
}


locals{

  image_type = {
    default = "centos-7"
    stage = "centos-7"
    prod = "centos-8"
  }

  instance_count = {
    default = 1
    stage = 1
    prod = 2
  }
}