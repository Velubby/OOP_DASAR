import 'dart:io';

class Mahasiswa {
  String nim;
  String nama;
  int semester;
  late KRS krs;
  List<Nilai> nilai = [];

  Mahasiswa({required this.nim, required this.nama, required this.semester}) {
    krs = KRS(this);
  }

  void tambahNilai(MataKuliah mataKuliah, double nilai) {
    this.nilai.add(Nilai(mataKuliah: mataKuliah, nilai: nilai));
  }

  double hitungIPK() {
    double totalSks = 0;
    double totalNilaiSks = 0;
    for (var nilai in this.nilai) {
      totalSks += nilai.mataKuliah.sks;
      totalNilaiSks += nilai.nilai * nilai.mataKuliah.sks;
    }
    if (totalSks == 0) {
      return 0;
    }
    return totalNilaiSks / totalSks;
  }
}

class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah({required this.kode, required this.nama, required this.sks});
}

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
  }
}

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai({required this.mataKuliah, required this.nilai});
}

// Fungsi untuk input nilai mahasiswa
void inputNilai(Mahasiswa mahasiswa) {
  print("Pilih mata kuliah:");
  int i = 1;
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    print("$i. ${mk.nama} (${mk.kode})");
    i++;
  }
  print("$i. Kembali");

  int pilihan = int.parse(stdin.readLineSync()!);
  if (pilihan == i) {
    return;
  }

  int indexMK = pilihan - 1;
  MataKuliah mataKuliah = mahasiswa.krs.daftarMataKuliah[indexMK];

  print("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  mahasiswa.tambahNilai(mataKuliah, nilai);
  print("Nilai berhasil ditambahkan.");
}

// Fungsi untuk mencetak KRS
void cetakKRS(Mahasiswa mahasiswa) {
  print("KRS Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
  print("-" * 30);
  print("Kode | Nama | SKS");
  print("-" * 30);
  for (var mk in mahasiswa.krs.daftarMataKuliah) {
    print("${mk.kode} | ${mk.nama} | ${mk.sks}");
  }
}

// Fungsi untuk mencetak transkrip nilai
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
  // Buat mata kuliah terlebih dahulu
  List<MataKuliah> mataKuliahList = [
    MataKuliah(kode: "MK101", nama: "Pemrograman Dasar", sks: 3),
    MataKuliah(kode: "MK202", nama: "Struktur Data", sks: 4),
    MataKuliah(kode: "MK303", nama: "Kalkulus", sks: 3),
  ];

  // Buat mahasiswa dan tambahkan mata kuliah ke KRS
  Mahasiswa mahasiswa1 =
      Mahasiswa(nim: " 12345678", nama: "John Doe", semester: 3);

  for (var mk in mataKuliahList) {
    mahasiswa1.krs.tambahMataKuliah(mk);
  }

  // Menu untuk input nilai
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
