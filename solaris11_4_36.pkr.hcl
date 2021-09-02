
variable "home" {
  type    = string
  default = "${env("HOME")}"
}

locals {
  iso_url = "file:///${var.home}/packer-solaris/sol-11_4_36_101_2-ai-x86.iso"
}

source "qemu" "solaris" {
  accelerator      = "kvm"
  boot_command     = ["e<down><down><down><down><down>",
   "<right><right><right><right><right><right><right><right><right><right>",
   "<right><right><right><right><right><right><right><right><right><right>",
   "<right><right><right><right><right><right><right><right><right><right>",
   "<right><right><right><right><right><right><right><right><right><right>",
   "<right><right><right><right><right><right><right><right><right><right>",
   "<del><del><del><del><del><del>",
   "http://{{ .HTTPIP }}:{{ .HTTPPort }}/default.xml<f10>",
   "<wait24m>",
   "<f2>{{ .Name }}<f2><wait><f2><wait><f2>europe<wait><f2>sweden<wait><f2>",
   "<wait><f2>english<wait><f2><down><down><down><wait><f2><wait>",
   "<f2>swedish<wait><f2>",
   "1vagrant<tab>1vagrant<tab>Vagrant<tab>vagrant<tab>1vagrant<tab>1vagrant<wait>",
   "<f2><wait><f2><wait><f2>"]
  boot_wait        = "1s"
  cpus             = "2"
  disk_compression = "true"
  disk_interface   = "virtio"
  disk_size        = "16384M"
  format           = "qcow2"
  headless         = "true"
  http_directory   = "http"
  iso_checksum     = "sha256:529624fab789764c13d0e85be867f38a71ff8d82e53282893d555de02528db9f"
  iso_url          = "${local.iso_url}"
  memory           = "2048"
  net_device       = "virtio-net"
  output_directory = "output_solaris11"
  shutdown_command = "echo 1vagrant | sudo -S /usr/sbin/poweroff"
  ssh_password     = "1vagrant"
  ssh_timeout      = "60m"
  ssh_username     = "vagrant"
  vm_name          = "solaris"
}

build {
  sources = ["source.qemu.solaris"]

  provisioner "shell" {
    execute_command = "echo '1vagrant' | sudo -S bash -c '{{ .Vars }} {{ .Path }}'"

    inline = ["/usr/sbin/svcadm disable sendmail",
      "/usr/sbin/svcadm disable asr-notify",
      "/usr/sbin/svcadm disable webui/server",
      "/usr/sbin/svcadm disable iscsi/initiator"]
  }

}
