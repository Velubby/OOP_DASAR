import '../lib/siswa.dart';

void main() {
  // Membuat object siswa
  print('=== Membuat Data Siswa ===');
  var siswa1 = Siswa('Budi Santoso', '2024001');
  var siswa2 = Siswa('Ani Wulandari', '2024002');

  // Mengisi nilai siswa1
  print('\n=== Mengisi Nilai Budi ===');
  siswa1.nilaiUTS = 85; // Menggunakan setter
  siswa1.nilaiUAS = 90;

  // Mengisi nilai siswa2
  print('\n=== Mengisi Nilai Ani ===');
  siswa2.nilaiUTS = 88;
  siswa2.nilaiUAS = 85;

  // Menambah hobi
  print('\n=== Menambah Hobi ===');
  siswa1.tambahHobi('Membaca');
  siswa1.tambahHobi('Coding');
  siswa2.tambahHobi('Menggambar');

  // Menampilkan data
  print('\n=== Data Semua Siswa ===');
  siswa1.tampilkanData();
  siswa2.tampilkanData();
}
