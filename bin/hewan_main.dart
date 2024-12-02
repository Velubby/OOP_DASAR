import '../lib/hewan.dart';

void main() {
  // Membuat objek Kucing
  print('=== Membuat Kucing ===');
  var kucing = Kucing('Meong', 2, 3.5, 'Oranye');

  // Membuat objek Burung
  print('=== Membuat Burung ===');
  var burung = Burung('Tweety', 1, 0.3, 15.0);

  // Menggunakan method dari parent class (Hewan)
  print('\n=== Aktivitas Hewan ===');
  kucing.makan();
  kucing.tidur();
  burung.makan();
  burung.tidur();

  // Menggunakan method khusus masing-masing hewan
  print('\n=== Suara Hewan ===');
  kucing.bersuara();
  burung.bersuara();

  // Method khusus lainnya
  print('\n=== Aktivitas Khusus ===');
  kucing.mencakar();
  burung.terbang();

  // Menampilkan informasi
  print('\n=== Informasi Hewan ===');
  kucing.tampilkanInfo();
  burung.tampilkanInfo();
}
