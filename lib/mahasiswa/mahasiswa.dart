// Mengimpor file yang diperlukan untuk kelas Mahasiswa
import 'krs.dart';
import 'mata_kuliah.dart';
import 'nilai.dart';

// Kelas Mahasiswa untuk menyimpan data mahasiswa dan operasional terkait nilai dan KRS
class Mahasiswa {
  String nim; // Nomor Induk Mahasiswa
  String nama; // Nama mahasiswa
  int semester; // Semester mahasiswa
  late KRS krs; // KRS yang berhubungan dengan mahasiswa ini
  List<Nilai> nilai = []; // Daftar nilai mahasiswa
  List<MataKuliah> mataKuliahTerisi =
      []; // Daftar mata kuliah yang sudah diambil oleh mahasiswa

  // Konstruktor untuk membuat objek Mahasiswa dengan NIM, nama, dan semester
  Mahasiswa({required this.nim, required this.nama, required this.semester}) {
    krs = KRS(this); // Membuat objek KRS terkait mahasiswa ini
  }

  // Fungsi untuk menambah nilai pada mata kuliah tertentu
  void tambahNilai(MataKuliah mataKuliah, double nilai) {
    this.nilai.add(Nilai(
        mataKuliah: mataKuliah,
        nilai: nilai)); // Menambahkan nilai pada daftar nilai
    mataKuliahTerisi.add(
        mataKuliah); // Menambahkan mata kuliah yang diambil ke daftar mata kuliah terisi
  }

  // Fungsi untuk menghitung IPK mahasiswa berdasarkan nilai dan SKS
  double hitungIPK() {
    double totalSks = 0; // Total SKS yang diambil
    double totalNilaiBerbobot = 0; // Total nilai berbobot (nilai dikali SKS)

    // Fungsi untuk mengonversi nilai ke bobot (A = 4.0, B = 3.0, C = 2.0, D = 1.0, E = 0.0)
    double konversiNilaiKeBobot(double nilai) {
      if (nilai >= 80) return 4.0; // A
      if (nilai >= 70) return 3.0; // B
      if (nilai >= 55) return 2.0; // C
      if (nilai >= 40) return 1.0; // D
      return 0.0; // E
    }

    // Perulangan untuk menghitung total SKS dan total nilai berbobot dari setiap mata kuliah yang diambil
    for (var nilai in this.nilai) {
      double bobot =
          konversiNilaiKeBobot(nilai.nilai); // Mengonversi nilai ke bobot
      totalSks += nilai.mataKuliah.sks; // Menambahkan SKS mata kuliah
      totalNilaiBerbobot +=
          bobot * nilai.mataKuliah.sks; // Menambahkan nilai berbobot ke total
    }

    // Jika total SKS adalah 0, artinya mahasiswa belum mengambil mata kuliah, sehingga IPK adalah 0
    if (totalSks == 0) {
      return 0; // Hindari pembagian dengan nol
    }

    // Menghitung dan mengembalikan IPK sebagai rata-rata berbobot
    return totalNilaiBerbobot / totalSks; // IPK
  }
}
