terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.46.1"
    }
  }
}

provider "proxmox" {
  # 建議在 fish shell 中設定 PROXMOX_VE_ENDPOINT, PROXMOX_VE_API_TOKEN, PROXMOX_VE_INSECURE
  # 如果沒有設定環境變數，可以在這裡取消註解並填寫：
  # endpoint = "https://192.168.1.100:8006/"
  # insecure = true
}

# 下載 Ubuntu 22.04 LTS Cloud Image
resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "youngtw"
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

# 將 Cloud-init 腳本上傳至 PVE 的 Snippets 儲存區
resource "proxmox_virtual_environment_file" "cloud_init_user_data" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "youngtw"

  source_raw {
    data = <<-EOF
    #cloud-config
    packages:
      - vim
      - fish

    runcmd:
      - chsh -s /usr/bin/fish ubuntu
    EOF

    file_name = "ubuntu-slurm-cloud-init.yaml"
  }
}

# 建立 Slurm 運算節點虛擬機
resource "proxmox_virtual_environment_vm" "slurm_node" {
  name      = "slurm-node01"
  node_name = "youngtw"

  agent {
    enabled = true
  }

  cpu {
    cores = 4
    type  = "host"
  }

  memory {
    dedicated = 8192
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 32
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    # 引用上方建立的 Cloud-init 檔案
    user_data_file_id = proxmox_virtual_environment_file.cloud_init_user_data.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "ubuntu"
      keys     = [
        # 替換為您 Fedora 工作站的實際 SSH 公鑰
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... young@fedora"
      ]
    }
  }
}