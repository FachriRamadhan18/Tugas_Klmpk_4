| No  | Nama             | Peran                  | Nilai |
| --- | ---------------- | ---------------------- | ----- |
| 1   | Fachri Ramadan   | Menjawab soal nomor 1. | 3     |
| 2   | M.Nafan Nabil N  | Menjawab soal nomor 4. | 3     |
| 3   | Raihan Alfazhari | Menjawab soal nomor 3. | 3     |
| 4   | Muhammad Fadhil  | Menjawab soal nomor 2. | 3     |
**Keterangan :**
0 : Tidak Aktif
1 : Kurang Aktif
2 : Cukup Aktif
3 : Sangat Aktif

# LRS (Logical Relation Schema)
Setelah memahami pembuatan ERD serta menentukan kardinalitas langkah berikutnya adalah mengolah rancangan ERD sesuai dengan teknik LRS (Logical Relation Schema) bentuk LRS akan menentukan  skema relational dalam perancangan database relasional (relasi table)

**Soal :**
1. Apa yang dimaksud dengan LRS?
2. Apa tujuan dari LRS? Mengapa ERD harus dikonversikan ke LRS?
3. Jelaskan aturan dalam mengkonversikan ERD ke LRS! Berikanlah contoh pada setiap poin aturan!
4. Apa hubungan antara LRS dan Normalisasi berikan penjelasan disertai contohnya!

**Jawaban :**
1. **LRS (Logical Relational Schema)** adalah skema logis yang menggambarkan hubungan antar entitas dalam bentuk tabel relasional pada database. LRS digunakan untuk mengubah rancangan konseptual (ERD) menjadi model yang dapat diterapkan dalam sistem database relasional.
2. **Tujuan dari LRS, dan mengapa ERD harus dikonversikan ke LRS!**
	- Mempermudah implementasi database dalam sistem manajemen basis data (DBMS).
	- Menyesuaikan rancangan konseptual (ERD) agar sesuai dengan model relasional.
	- Memastikan bahwa data dapat diakses dan diorganisir secara efisien. 
	- ERD harus dikonversi ke LRS karena ERD bersifat konseptual dan belum dalam bentuk yang dapat digunakan langsung dalam DBMS. LRS mengubahnya menjadi bentuk tabel yang memiliki atribut, relasi, dan kunci utama.
3.  **Aturan mengkonversikan ERD ke LRS dan contohnya!**
	- Setiap entitas dalam ERD menjadi tabel dalam LRS.Contoh: Jika ada entitas Mahasiswa(id, nama, alamat) dalam ERD, maka di LRS akan menjadi tabel Mahasiswa(id, nama, alamat) dengan id sebagai primary key.
	- Setiap atribut menjadi kolom dalam tabel.Contoh: Entitas Dosen(id, nama, nip) akan dikonversi menjadi tabel dengan kolom id, nama, dan nip.
	- Relasi satu ke banyak (1:N) ditransformasikan dengan menambahkan foreign key di tabel yang berada di sisi banyak.Contoh: Relasi antara Mahasiswa dan Jurusan (satu jurusan memiliki banyak mahasiswa) dikonversi dengan menambahkan id_jurusan sebagai foreign key di tabel Mahasiswa.
	- Relasi banyak ke banyak (M:N) harus dipecah menjadi tabel baru. Contoh: Jika Mahasiswa mengambil banyak Mata Kuliah, maka dibuat tabel baru KRS(id_mahasiswa, id_matakuliah) sebagai penghubung. 
	- Relasi satu ke satu (1:1) bisa digabung atau dijadikan tabel terpisah dengan foreign key. Contoh: Jika entitas Dosen memiliki detail spesifik dalam entitas DosenDetail, maka bisa dibuat tabel baru atau langsung digabung ke tabel Dosen.
4. **Apa hubungan LRS dan Normalisasi? dan contoh!**
	- Hubungan LRS dan Normalisasi : LRS membantu menyusun skema database, sedangkan normalisasi memastikan skema tersebut efisien dengan menghilangkan redundansi dan anomali data. Normalisasi diterapkan pada LRS untuk meningkatkan efisiensi penyimpanan dan integritas data.
	- Contoh:
		- Jika ada tabel Mahasiswa(id, nama, alamat, jurusan, nama_jurusan), maka terjadi redundansi pada nama_jurusan.
		- Dengan normalisasi, tabel ini dipecah menjadi dua:
			- Mahasiswa(id, nama, alamat, id_jurusan)
			- Jurusan(id_jurusan, nama_jurusan)
		- Ini memastikan bahwa nama_jurusan hanya disimpan sekali dan tidak berulang di tabel Mahasiswa.