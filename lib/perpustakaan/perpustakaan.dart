import 'buku.dart';
import 'anggota.dart';

class Perpustakaan {
  // Properties
  String nama;
  late List<Buku> daftarBuku;
  late List<Anggota> daftarAnggota;

  // Constructor
  Perpustakaan(this.nama) {
    daftarBuku = [];
    daftarAnggota = [];
  }

  // Methods
  void tambahBuku(Buku buku) {
    daftarBuku.add(buku);
    print('Buku ${buku.judul} ditambahkan ke perpustakaan');
  }

  void daftarAnggotaBaru(Anggota anggota) {
    daftarAnggota.add(anggota);
    print('Anggota baru ${anggota.nama} terdaftar');
  }

  Buku? cariBuku(String judul) {
    try {
      return daftarBuku.firstWhere(
          (buku) => buku.judul.toLowerCase() == judul.toLowerCase());
    } catch (e) {
      print('Buku "$judul" tidak ditemukan');
      return null;
    }
  }

  void tampilkanSemuaBuku() {
    print('\nDaftar Buku di $nama:');
    if (daftarBuku.isEmpty) {
      print('Belum ada buku');
      return;
    }

    for (var buku in daftarBuku) {
      buku.tampilkanInfo();
    }
  }

  void tampilkanAnggota() {
    print('\nDaftar Anggota $nama:');
    if (daftarAnggota.isEmpty) {
      print('Belum ada anggota');
      return;
    }

    for (var anggota in daftarAnggota) {
      print('- ${anggota.nama} (ID: ${anggota.id})');
    }
  }
}
