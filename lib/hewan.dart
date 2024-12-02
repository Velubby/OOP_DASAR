class Hewan {
  String nama;
  int umur;
  double berat;

  // Constructor untuk class Hewan
  Hewan(this.nama, this.umur, this.berat);

  // Method yang akan diwariskan
  void makan() {
    print('$nama sedang makan');
    berat = berat + 0.2; // Berat bertambah setelah makan
  }

  void tidur() {
    print('$nama sedang tidur');
  }

  // Method untuk menampilkan info hewan
  void tampilkanInfo() {
    print('\nInformasi Hewan:');
    print('Nama: $nama');
    print('Umur: $umur tahun');
    print('Berat: ${berat.toStringAsFixed(1)} kg');
  }
}

class Kucing extends Hewan {
  String warnaBulu;

  // Constructor Kucing
  Kucing(String nama, int umur, double berat, this.warnaBulu)
      : super(nama, umur, berat);

  // Method khusus Kucing
  void bersuara() {
    print('$nama mengeong: Meooong!');
  }

  void mencakar() {
    print('$nama mencakar-cakar');
  }

  // Override method tampilkanInfo
  @override
  void tampilkanInfo() {
    super.tampilkanInfo(); // Memanggil method parent
    print('Warna Bulu: $warnaBulu');
  }
}

class Burung extends Hewan {
  double panjangSayap;

  // Constructor Burung
  Burung(String nama, int umur, double berat, this.panjangSayap)
      : super(nama, umur, berat);

  // Method khusus Burung
  void bersuara() {
    print('$nama berkicau: Cuit cuit!');
  }

  void terbang() {
    print('$nama terbang menggunakan sayapnya');
  }

  // Override method tampilkanInfo
  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Panjang Sayap: ${panjangSayap.toStringAsFixed(1)} cm');
  }
}
