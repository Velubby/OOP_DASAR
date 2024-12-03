// Kelas MataKuliah untuk mendefinisikan informasi tentang mata kuliah
class MataKuliah {
  String kode; // Kode mata kuliah (misal: "MK101")
  String nama; // Nama mata kuliah (misal: "Pemrograman Web")
  int sks; // Jumlah SKS mata kuliah (misal: 3)

  // Konstruktor untuk menginisialisasi objek MataKuliah dengan kode, nama, dan SKS
  MataKuliah({required this.kode, required this.nama, required this.sks});
}
