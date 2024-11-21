 
| No  | Nama             | Peran          | Nilai |
| --- | ---------------- | -------------- | ----- |
| 1   | Fachri Ramadan   | Mencari Materi | 3     |
| 2   | M. Nafan Nabil.n | Mencari Materi | 3     |
| 3   | Raihan Alfazhari | Mencari Materi | 3     |
| 4   | Muhammad Fadhil  | Mencari Materi | 3     |
**Keterangan :**
0 : Tidak Aktif
1 : Kurang Aktif
2 : Cukup Aktif
3 : Sangat Aktif
#  Permasalahan, Solusi, dan Konsep ERD

## Fadil 
**Permasalahan:**
Data yang tidak terorganisir dalam spreadsheet besar menyebabkan duplikasi informasi, seperti alamat pelanggan yang berbeda, dan kesalahan dalam pelacakan pesanan serta pengiriman produk yang salah.

**Solusi:**
Memisahkan data ke dalam tabel-tabel yang lebih kecil seperti tabel Pelanggan, Produk, dan Pesanan, yang saling terhubung. Ini memudahkan pengelolaan data dengan mengurangi duplikasi dan memungkinkan setiap perubahan dilakukan di satu tempat.

**Konsep ERD:**
ERD (Entity Relationship Diagram) adalah alat visual yang menunjukkan bagaimana tabel (entitas) saling terhubung melalui atribut dan hubungan antar entitas. ERD mempermudah memahami struktur database dan menemukan kesalahan, serta dapat digunakan untuk membangun atau memodifikasi database dengan cepat.

## Fachri
**Permasalahan:**
Ketika data pesanan dan pelanggan dicatat dalam satu spreadsheet besar, sering terjadi kekacauan. Ada data yang berulang (seperti alamat berbeda untuk satu pelanggan), membuat pengelolaan pesanan sulit dan bisa menyebabkan pengiriman salah.

**Solusi:**
Pisahkan data ke dalam tabel yang lebih kecil dan spesifik, seperti tabel Pelanggan, Produk, dan Pesanan. Setiap tabel menyimpan data tertentu, dan ini membantu mengurangi duplikasi dan memastikan semua informasi lebih teratur.

**Konsep ERD:**
ERD (Entity Relationship Diagram) adalah cara visual untuk menunjukkan bagaimana data dalam berbagai tabel saling terkait. Setiap tabel diubah menjadi entitas, dengan kolom-kolom menjadi atributnya. Hubungan antar tabel divisualisasikan sehingga mudah dilihat dan dipahami bagaimana data terhubung di dalam database.

## Nafan
**Permasalahan:**
Data di spreadsheet besar menjadi berantakan, banyak informasi ganda, dan susah melacak pesanan serta pelanggan.

**Solusi:**
Pisahkan data ke dalam tabel berbeda (pelanggan, produk, pesanan) dan hubungkan. Ini membuat data lebih teratur dan mudah dikelola.

**Konsep ERD:**
ERD (Entity Relationship Diagram) memvisualisasikan hubungan antar tabel, sehingga lebih mudah memahami cara kerja database dan menemukan kesalahan.


## Raihan
**Permasalahan:**
Jika data pelanggan dan pesanan dicatat dalam satu spreadsheet besar, akan ada masalah seperti duplikasi data, informasi yang tidak akurat, serta kesulitan dalam melacak pesanan yang benar. Hal ini dapat menyebabkan pengiriman yang salah, kebingungan pelanggan, dan produk yang salah dikirim.

**Solusi:**
mengatasi kekacauan dan duplikasi data dalam sistem penjualan, informasi harus dipisahkan ke dalam beberapa tabel yang berbeda, seperti tabel Pelanggan, Produk, dan Pesanan. Setiap tabel terhubung satu sama lain untuk melacak data dengan lebih efisien dan terorganisir. Entity Relationship Diagram (ERD) digunakan untuk memvisualisasikan hubungan antar tabel ini.

**Konsep ERD:**
ERD adalah cara visual untuk melihat struktur dasar data. Setiap tabel di database ditampilkan sebagai entitas, atribut di dalamnya adalah kolom, dan hubungan antar entitas (tabel) ditunjukkan dengan garis hubungan. ERD membantu memvisualisasikan database, menemukan kesalahan, dan mempermudah pemahaman struktur data bagi pengguna baru.

# 3 Pernyataan

## 1. ERD ngebantu kita lihat struktur database secara visual kayak hubungan antara tabel pelanggan, produk, dan pesanan.

## 2. ERD juga bisa dipakai  buat konsep awal database, terus diagramnya bisa langsung jadi kode tanpa harus bikin ulang manual

## 3. ERD bikin lebih gampang deteksi kesalahan, data ganda, dan  bantu orang paham cara kerja database besar
