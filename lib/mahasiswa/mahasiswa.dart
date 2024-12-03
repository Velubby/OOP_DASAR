import 'krs.dart';
import 'mata_kuliah.dart';
import 'nilai.dart';

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
