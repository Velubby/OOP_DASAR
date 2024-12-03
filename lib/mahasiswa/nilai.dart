import 'mata_kuliah.dart';

// Kelas Nilai untuk mendefinisikan nilai yang diperoleh mahasiswa pada mata kuliah
class Nilai {
  MataKuliah
      mataKuliah; // Objek MataKuliah yang menunjukkan mata kuliah yang diambil
  double nilai; // Nilai yang diperoleh mahasiswa pada mata kuliah tersebut

  // Konstruktor untuk menginisialisasi objek Nilai dengan mata kuliah dan nilai
  Nilai({required this.mataKuliah, required this.nilai});
}
