// Mengimpor kelas MataKuliah dan Mahasiswa yang diperlukan untuk kelas KRS
import 'mata_kuliah.dart';
import 'mahasiswa.dart';

// Kelas KRS untuk menyimpan data Kartu Rencana Studi (KRS) yang dimiliki oleh mahasiswa
class KRS {
  Mahasiswa mahasiswa; // Referensi ke objek Mahasiswa yang memiliki KRS ini
  List<MataKuliah> daftarMataKuliah =
      []; // Daftar mata kuliah yang terdaftar dalam KRS

  // Konstruktor untuk membuat objek KRS dengan referensi mahasiswa
  KRS(this.mahasiswa);

  // Fungsi untuk menambah mata kuliah ke dalam daftar mata kuliah yang terdaftar dalam KRS
  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah); // Menambahkan mata kuliah ke daftar
  }
}
