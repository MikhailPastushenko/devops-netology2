provider "yandex" {

  zone = "ru-central1-a"
  token = var.yc_token
  cloud_id  = var.yc_cloudid
  folder_id = var.yc_folderid
}

data "yandex_compute_image" "image" {
  family = local.image_type[terraform.workspace]
}

resource "yandex_compute_instance" "VM_Netology" {

  # name = "netologyvm1"

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
    #  image_id = "fd8doapv0sf8ofgpd0jh"

    }
}
  resources {
    cores  = 2
    memory = 4
  }
  network_interface{
  subnet_id = "e9b21sd1ctj4kpjn0u2a"
  }

  # count = local.instance_count[terraform.workspace]
  for_each = {"vm1" = "netologyvm1", "vm2" = "netologyvm2"}
  name = each.value


}