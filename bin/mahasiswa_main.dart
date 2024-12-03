// Import pustaka yang diperlukan
import 'dart:io';
import '../lib/mahasiswa/mahasiswa.dart';
import '../lib/mahasiswa/mata_kuliah.dart';

// Fungsi untuk menginput nilai mahasiswa
void inputNilai(Mahasiswa mahasiswa) {
  // Cek jika tidak ada mata kuliah yang tersedia dalam KRS
  if (mahasiswa.krs.daftarMataKuliah.isEmpty) {
    print("Tidak ada mata kuliah yang tersedia.");
    return;
  }

  // Menampilkan daftar mata kuliah yang tersedia
  print("Pilih mata kuliah:");
  int i = 1;
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    // Mengecek apakah nilai sudah diisi untuk mata kuliah tersebut
    bool sudahDinilai = mahasiswa.nilai.any((n) => n.mataKuliah == mk);
    // Menampilkan mata kuliah dengan status 'Sudah Dinilai' jika nilai sudah diisi
    print(
        "$i. ${mk.nama} (${mk.kode}) ${sudahDinilai ? '[Sudah Dinilai]' : ''}");
    i++;
  }
  print("$i. Kembali");

  // Meminta input dari user untuk memilih mata kuliah
  int pilihan = int.parse(stdin.readLineSync()!);
  if (pilihan == i) {
    return; // Jika memilih untuk kembali
  }

  // Mengambil mata kuliah yang dipilih oleh mahasiswa
  int indexMK = pilihan - 1;
  MataKuliah mataKuliah = mahasiswa.krs.daftarMataKuliah[indexMK];

  // Cek jika nilai sudah diisi untuk mata kuliah yang dipilih
  if (mahasiswa.nilai.any((n) => n.mataKuliah == mataKuliah)) {
    print("Nilai untuk mata kuliah ini sudah diisi.");
    return;
  }

  // Meminta mahasiswa untuk memasukkan nilai mata kuliah
  print("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  // Menambahkan nilai yang dimasukkan ke dalam daftar nilai mahasiswa
  mahasiswa.tambahNilai(mataKuliah, nilai);
  print("Nilai berhasil ditambahkan.");
}

// Fungsi untuk mencetak KRS mahasiswa
void cetakKRS(Mahasiswa mahasiswa) {
  // Menampilkan informasi umum tentang KRS mahasiswa
  print("KRS Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("=" * 40);
  // Menampilkan header kolom tabel
  print(
      "${'Kode'.padRight(10)} | ${'Nama Mata Kuliah'.padRight(20)} | ${'SKS'}");
  print("-" * 40);
  // Menampilkan daftar mata kuliah yang diambil mahasiswa
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    print("${mk.kode.padRight(10)} | ${mk.nama.padRight(20)} | ${mk.sks}");
  }
  print("=" * 40);
}

// Fungsi untuk mencetak transkrip nilai mahasiswa
void cetakTranskrip(Mahasiswa mahasiswa) {
  // Menampilkan informasi umum tentang transkrip mahasiswa
  print("Transkrip Nilai Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("=" * 60);
  // Menampilkan header kolom tabel untuk transkrip
  print(
      "${'Kode'.padRight(10)} | ${'Nama Mata Kuliah'.padRight(20)} | ${'SKS'.padRight(3)} | ${'Nilai'.padRight(5)}");
  print("-" * 60);
  // Menampilkan nilai setiap mata kuliah yang diambil mahasiswa
  for (var nilai in mahasiswa.nilai) {
    print(
        "${nilai.mataKuliah.kode.padRight(10)} | ${nilai.mataKuliah.nama.padRight(20)} | ${nilai.mataKuliah.sks.toString().padRight(3)} | ${nilai.nilai.toStringAsFixed(2).padRight(5)}");
  }
  print("-" * 60);
  // Menampilkan IPK mahasiswa yang dihitung dari nilai
  print("IPK: ${mahasiswa.hitungIPK().toStringAsFixed(2).padLeft(50)}");
  print("=" * 60);
}

// Fungsi utama untuk menjalankan program
void main() {
  // Membuat daftar mata kuliah yang ditawarkan
  List<MataKuliah> mataKuliahList = [
    MataKuliah(kode: "MK101", nama: "Pemrograman Web", sks: 2),
    MataKuliah(kode: "MK202", nama: "Struktur Data", sks: 3),
    MataKuliah(kode: "MK303", nama: "Kalkulus", sks: 3),
  ];

  // Membuat objek mahasiswa dengan data awal
  Mahasiswa mahasiswa1 =
      Mahasiswa(nim: "230103256", nama: "Achmad Ichwani", semester: 3);

  // Menambahkan mata kuliah ke dalam KRS mahasiswa
  for (var mk in mataKuliahList) {
    mahasiswa1.krs.tambahMataKuliah(mk);
  }

  // Menu interaktif untuk mahasiswa
  while (true) {
    print("\nMenu:");
    print("1. Input Nilai");
    print("2. Cetak KRS");
    print("3. Cetak Transkrip");
    print("4. Keluar");
    print("Pilih opsi: ");

    // Membaca pilihan pengguna dari input
    int pilihan = int.parse(stdin.readLineSync()!);

    // Menentukan aksi berdasarkan pilihan yang dimasukkan pengguna
    switch (pilihan) {
      case 1:
        inputNilai(mahasiswa1); // Input nilai untuk mata kuliah
        break;
      case 2:
        cetakKRS(mahasiswa1); // Cetak KRS mahasiswa
        break;
      case 3:
        cetakTranskrip(mahasiswa1); // Cetak transkrip nilai mahasiswa
        break;
      case 4:
        print("Keluar dari program."); // Keluar dari program
        return;
      default:
        print(
            "Pilihan tidak valid. Silakan coba lagi."); // Pesan jika input tidak valid
    }
  }
}
