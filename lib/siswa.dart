class Siswa {
  // Properties
  String nama;
  String nis;
  int _nilaiUTS = 0; // Private property
  int _nilaiUAS = 0; // Private property
  List<String> hobi = []; // List untuk menyimpan hobi

  // Constructor
  Siswa(this.nama, this.nis) {
    hobi = []; // Inisialisasi list hobi kosong
  }

  // Getter untuk nilai akhir
  double get nilaiAkhir {
    return (_nilaiUTS + _nilaiUAS) / 2;
  }

  // Setter untuk nilai UTS
  set nilaiUTS(int nilai) {
    if (nilai >= 0 && nilai <= 100) {
      _nilaiUTS = nilai;
      print('Nilai UTS $nama berhasil diubah');
    } else {
      print('Nilai tidak valid! (0-100)');
    }
  }

  // Setter untuk nilai UAS
  set nilaiUAS(int nilai) {
    if (nilai >= 0 && nilai <= 100) {
      _nilaiUAS = nilai;
      print('Nilai UAS $nama berhasil diubah');
    } else {
      print('Nilai tidak valid! (0-100)');
    }
  }

  // Method untuk menambah hobi
  void tambahHobi(String hobiBaru) {
    hobi.add(hobiBaru);
    print('Hobi $hobiBaru ditambahkan ke daftar hobi $nama');
  }

  // Method untuk menampilkan data siswa
  void tampilkanData() {
    print('\nData Siswa:');
    print('Nama: $nama');
    print('NIS: $nis');
    print('Nilai UTS: $_nilaiUTS');
    print('Nilai UAS: $_nilaiUAS');
    print('Nilai Akhir: ${nilaiAkhir.toStringAsFixed(1)}');

    if (hobi.isEmpty) {
      print('Belum ada hobi');
    } else {
      print('Hobi: ${hobi.join(", ")}');
    }
  }
}
