provider "yandex" {

  zone = "ru-central1-a"
  token = var.yc_token
  cloud_id  = var.yc_cloudid
  folder_id = var.yc_folderid
}

resource "yandex_compute_instance" "VM_Netology" {
  name = "netologyvm1"

  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd8doapv0sf8ofgpd0jh"
    }

}
  network_interface{
  subnet_id = "e9b21sd1ctj4kpjn0u2a"
  }

}