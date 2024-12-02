import '../lib/perpustakaan/perpustakaan.dart';
import '../lib/perpustakaan/buku.dart';
import '../lib/perpustakaan/anggota.dart';

void main() {
  // Membuat perpustakaan
  var perpus = Perpustakaan('Perpustakaan Kota');
  // Menambah buku
  print('=== Menambah Buku ===');
  var buku1 = Buku('Laskar Pelangi', 'Andrea Hirata', 'ISBN-001');
  var buku2 = Buku('Bumi Manusia', 'Pramoedya Ananta Toer', 'ISBN-002');
  perpus.tambahBuku(buku1);
  perpus.tambahBuku(buku2);
  // Mendaftarkan anggota
  print('\n=== Mendaftarkan Anggota ===');
  var anggota1 = Anggota('Budi', 'A001');
  var anggota2 = Anggota('Ani', 'A002');
  perpus.daftarAnggotaBaru(anggota1);
  perpus.daftarAnggotaBaru(anggota2);
  // Peminjaman buku
  print('\n=== Proses Peminjaman ===');
  anggota1.pinjamBuku(buku1);
  anggota2.pinjamBuku(buku2);
  // Menampilkan status
  perpus.tampilkanSemuaBuku();
  print('\n=== Status Peminjaman ===');
  anggota1.tampilkanPinjaman();
  anggota2.tampilkanPinjaman();
  // Pengembalian buku
  print('\n=== Proses Pengembalian ===');
  anggota1.kembalikanBuku(buku1);

  // Tampilkan status akhir
  perpus.tampilkanSemuaBuku();
}
