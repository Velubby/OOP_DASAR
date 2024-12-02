class Buku {
  // Properties
  String judul;
  String penulis;
  String isbn;
  bool _tersedia; // Status ketersediaan buku

  // Constructor
  Buku(this.judul, this.penulis, this.isbn) : _tersedia = true;

  // Getter
  bool get tersedia => _tersedia;

  // Methods
  void pinjam() {
    if (_tersedia) {
      _tersedia = false;
      print('Buku $judul berhasil dipinjam');
    } else {
      print('Maaf, buku $judul sedang dipinjam');
    }
  }

  void kembali() {
    if (!_tersedia) {
      _tersedia = true;
      print('Buku $judul berhasil dikembalikan');
    } else {
      print('Buku $judul sudah ada di perpustakaan');
    }
  }

  void tampilkanInfo() {
    print('\nInformasi Buku:');
    print('Judul: $judul');
    print('Penulis: $penulis');
    print('ISBN: $isbn');
    print('Status: ${_tersedia ? "Tersedia" : "Dipinjam"}');
  }
}
