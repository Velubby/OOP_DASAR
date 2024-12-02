import 'buku.dart';

class Anggota {
  // Properties
  String nama;
  String id;
  late List<Buku> bukuDipinjam;

  // Constructor
  Anggota(this.nama, this.id) {
    bukuDipinjam = [];
  }

  // Methods
  void pinjamBuku(Buku buku) {
    if (buku.tersedia) {
      buku.pinjam();
      bukuDipinjam.add(buku);
      print('$nama meminjam buku ${buku.judul}');
    }
  }

  void kembalikanBuku(Buku buku) {
    if (bukuDipinjam.contains(buku)) {
      buku.kembali();
      bukuDipinjam.remove(buku);
      print('$nama mengembalikan buku ${buku.judul}');
    } else {
      print('$nama tidak meminjam buku ini');
    }
  }

  void tampilkanPinjaman() {
    print('\nDaftar Buku yang Dipinjam $nama:');
    if (bukuDipinjam.isEmpty) {
      print('Tidak ada buku yang dipinjam');
    } else {
      for (var buku in bukuDipinjam) {
        print('- ${buku.judul} (${buku.penulis})');
      }
    }
  }
}
