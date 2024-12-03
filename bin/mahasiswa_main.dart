import 'dart:io';
import '../lib/mahasiswa/mahasiswa.dart';
import '../lib/mahasiswa/mata_kuliah.dart';

void inputNilai(Mahasiswa mahasiswa) {
  if (mahasiswa.krs.daftarMataKuliah.isEmpty) {
    print("Tidak ada mata kuliah yang tersedia.");
    return;
  }

  print("Pilih mata kuliah:");
  int i = 1;
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    // Periksa apakah nilai sudah diisi untuk mata kuliah ini
    bool sudahDinilai = mahasiswa.nilai.any((n) => n.mataKuliah == mk);
    print(
        "$i. ${mk.nama} (${mk.kode}) ${sudahDinilai ? '[Sudah Dinilai]' : ''}");
    i++;
  }
  print("$i. Kembali");

  int pilihan = int.parse(stdin.readLineSync()!);
  if (pilihan == i) {
    return;
  }

  int indexMK = pilihan - 1;
  MataKuliah mataKuliah = mahasiswa.krs.daftarMataKuliah[indexMK];

  // Cek jika sudah dinilai
  if (mahasiswa.nilai.any((n) => n.mataKuliah == mataKuliah)) {
    print("Nilai untuk mata kuliah ini sudah diisi.");
    return;
  }

  print("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  mahasiswa.tambahNilai(mataKuliah, nilai);
  print("Nilai berhasil ditambahkan.");
}

void cetakKRS(Mahasiswa mahasiswa) {
  print("KRS Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("-" * 30);
  print("Kode | Nama | SKS | Status");
  print("-" * 30);
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    // Periksa apakah nilai sudah diisi
    bool sudahDinilai = mahasiswa.nilai.any((n) => n.mataKuliah == mk);
    String status = sudahDinilai ? "Sudah Dinilai" : "Belum Dinilai";
    print("${mk.kode} | ${mk.nama} | ${mk.sks} | $status");
  }
}

void cetakTranskrip(Mahasiswa mahasiswa) {
  print("Transkrip Nilai Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("-" * 30);
  print("Kode | Nama | SKS | Nilai");
  print("-" * 30);
  for (var nilai in mahasiswa.nilai) {
    print(
        "${nilai.mataKuliah.kode} | ${nilai.mataKuliah.nama} | ${nilai.mataKuliah.sks} | ${nilai.nilai}");
  }
  print("IPK: ${mahasiswa.hitungIPK()}");
}

void main() {
  List<MataKuliah> mataKuliahList = [
    MataKuliah(kode: "MK101", nama: "Pemrograman Web", sks: 2),
    MataKuliah(kode: "MK202", nama: "Struktur Data", sks: 3),
    MataKuliah(kode: "MK303", nama: "Kalkulus", sks: 3),
  ];

  Mahasiswa mahasiswa1 =
      Mahasiswa(nim: "12345678", nama: "Achmad Ichwani", semester: 3);

  for (var mk in mataKuliahList) {
    mahasiswa1.krs.tambahMataKuliah(mk);
  }

  while (true) {
    print("\nMenu:");
    print("1. Input Nilai");
    print("2. Cetak KRS");
    print("3. Cetak Transkrip");
    print("4. Keluar");
    print("Pilih opsi: ");

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        inputNilai(mahasiswa1);
        break;
      case 2:
        cetakKRS(mahasiswa1);
        break;
      case 3:
        cetakTranskrip(mahasiswa1);
        break;
      case 4:
        print("Keluar dari program.");
        return;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
    }
  }
}
