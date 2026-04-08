UI_PRINT "--- Menginstal Systemless Ubuntu Chroot ---"
UBUNTU_DIR="/data/local/ubuntu"

# Bikin folder kalau belum ada
if [ ! -d "$UBUNTU_DIR" ]; then
    UI_PRINT "- Membuat direktori $UBUNTU_DIR..."
    mkdir -p "$UBUNTU_DIR"
fi

UI_PRINT "- Mengekstrak rootfs.tar.gz ke $UBUNTU_DIR..."
UI_PRINT "- (Ini bisa makan waktu agak lama, sabar bre!)"

# Ekstrak rootfs dari dalem zip module ke /data/local/ubuntu
tar -xf "$MODPATH/rootfs.tar.gz" -C "$UBUNTU_DIR"

UI_PRINT "- Ekstrak selesai!"

# Hapus file tarball dari directory module biar ga menuhin memori sistem
rm -f "$MODPATH/rootfs.tar.gz"

# Set permission dasar
set_perm_recursive "$UBUNTU_DIR" 0 0 0755 0755
