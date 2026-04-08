# 🐧 Systemless Ubuntu Chroot
**By Damzz25 Prjkt**

Bawa environment PC utuh ke dalam saku HP lu! Module Magisk ini memungkinkan lu ngejalanin **Ubuntu Rootfs** secara *native* menggunakan metode `chroot` di Android. 

Didesain **100% systemless**, artinya nggak akan ngerusak partisi sistem bawaan HP lu. Setelah di-install, lu bisa masuk ke OS Ubuntu dari aplikasi terminal mana aja cukup dengan command `ubuntu`! :v

---

## ✨ Fitur
* **Systemless Integration:** Rootfs diekstrak aman ke `/data/local/ubuntu`.
* **Global Access:** Perintah `ubuntu` otomatis terbaca dari terminal apapun (Termux, Terminal Emulator, ADB Shell).
* **Native Performance:** Karena pake `chroot` (bukan `proot`), jalan langsung di atas kernel Linux bawaan Android. Zero overhead!
* **Auto-Mount:** Otomatis nge-mount `/dev`, `/proc`, `/sys`, dan `/sdcard` saat masuk.

---

## 📋 Persyaratan
1. HP Rooted (Magisk atau KernelSU).
2. File **Ubuntu Rootfs ARM64** (format `.tar.gz`).
3. Aplikasi Terminal (Termux sangat disarankan).
4. Sisa penyimpanan internal minimal 2-3 GB.

---

## 🛠️ Cara Instalasi
1. Download zip module Magisk.
2. Buka menu aplikasi magisk/kernelsu
3. Pilih menu **Modules** -> **Install from storage**.
4. Pilih zip module tersebut dan tunggu proses ekstrak selesai.
5. **Reboot**.

---

## 🚀 Cara Penggunaan
Buka aplikasi terminal lu, lalu gunakan salah satu dari dua cara di bawah ini buat masuk ke Ubuntu:

**Cara 1 (Manual):**
```
su
ubuntu
```

**Cara 2 (One line)**
```
su -c ubuntu
```

## 🔧 First-Time Setup (WAJIB!)
Saat pertama kali masuk ke Ubuntu, sistem lu belum punya akses internet dan folder temporary-nya masih terkunci. Jalankan command di bawah ini secara berurutan:
**1. Fix Internet & DNS Android:**
```
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
groupadd -g 3003 aid_inet
usermod -aG aid_inet root
usermod -aG aid_inet _apt
```
**2. Fix Permission /tmp & GPG Error:**
```
mkdir -p /tmp
mkdir -p /var/tmp
chmod 1777 /tmp
chmod 1777 /var/tmp
```
**3. Update Repository**
```
apt update
apt upgrade -y
```

🚪 Cara Keluar
Untuk kembali ke terminal Android biasa, cukup ketik:
```
exit
```
Atau tekan kombinasi Ctrl + D.

Created with ☕ by Damzz25 Prjkt
