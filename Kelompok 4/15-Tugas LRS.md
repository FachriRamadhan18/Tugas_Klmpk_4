| No  | Nama             | Peran                  | Nilai |
| --- | ---------------- | ---------------------- | ----- |
| 1   | Fachri Ramadan   | Menjawab soal nomor 1. | 3     |
| 2   | M.Nafan Nabil N  | Menjawab soal nomor 1. | 2     |
| 3   | Raihan Alfazhari | Menjawab soal nomor 2. | 3     |
| 4   | Muhammad Fadhil  | Menjawab soal nomor 2. | 3     |
**Keterangan :**
0 : Tidak Aktif
1 : Kurang Aktif
2 : Cukup Aktif
3 : Sangat Aktif


# Soal
1. Mengapa table siswa dan table kartu pelajar terpisah menjadi dua table dan di hubungkan secara one to one, berikan pula contoh yang lain yang semisal dengan kasus tersebut!
2. Analisislah 5 bentuk kardinalitas di database masing masing sesuai dengan konsep LRS!
# Jawaban 
#### 1. **Mengapa Tabel Siswa dan Tabel Kartu Pelajar Terpisah dan Dihubungkan One-to-One?**

**a. Normalisasi Data:**  
Memisahkan tabel siswa dan tabel kartu pelajar membantu menghindari pengulangan data dan meningkatkan efisiensi penyimpanan. Data siswa seperti NIS, nama, alamat, No_Hp dan  disimpan di tabel **Siswa**, sementara informasi spesifik kartu pelajar seperti NIS, nama, dan kode kelas disimpan di tabel **Kartu Pelajar**.
**b. Keamanan dan Privasi:**  
Memisahkan data sensitif atau unik seperti nomor kartu pelajar memungkinkan penerapan kontrol akses yang lebih ketat di tabel **Kartu Pelajar** tanpa memengaruhi tabel **Siswa**.

**c. Manajemen Data yang Lebih Baik:**  
 Dengan pemisahan ini, jika ada perubahan pada data kartu pelajar (seperti perpanjangan masa berlaku), hanya tabel **Kartu Pelajar** yang diperbarui tanpa mengubah data siswa.

##### **Contoh Kasus Serupa:**
1. **Tabel Kendaraan dan Tabel Surat Tanda Nomor Kendaraan (STNK):**
    
    - **Kendaraan:** Menyimpan data kendaraan seperti merk, model, dan tahun produksi.
    - **STNK:** Menyimpan informasi tentang nomor STNK, tanggal terbit, dan masa berlaku.  
        Setiap kendaraan memiliki satu STNK yang unik.

Perluasan hubungan one-to-one ini membuat database lebih terstruktur dan mudah dikelola.

#### **2. Analisislah 5 bentuk kardinalitas di database masing masing sesuai dengan konsep LRS!**
**a. Many to Many (Sponsor ke Event Sekolah) :**
  Pada table Sponsor dan table Event sekolah kardinalitas yang digunakan adalah many to many dikarenakan banyak sponsor bisa mensponsori banyak event sekolah dan begitupun sebaliknya, dan untuk menghubungkannya dibutuhkan table pivot (Sponsor_Event) sebagai penghubung kedua table yang ber-kardinalitas many to many. Lalu data pada kedua table terhubung melalui "Id_Sponsor_Event" yang menjadi foreign key.
 **b. One to Many (Siswa ke Jurusan) :**
   Pada table Siswa dan table Jurusan kardinalitas yang digunakan adalah one to many dikarenakan satu siswa hanya dapat memili satu jurusan sedangkan satu jurusan dapat memiliki banyak siswa. Lalu data pada kedua table terhubung melalui "Id_Jurusan" sebagai Foreign key.
 **c. One to One (Eskul ke Detail) :**
   Pada table Eskul dan table Detail kardinalitas yang digunakan adalah one to one dikarenakan satu eskul hanya dapat memiliki satu detail dan begitupun sebaliknya, lalu data pada kedua table terhubung melalui "id_detail" yang menjadi Foreign Key
 **d. Many to Many (Panitia ke Event Sekolah)**
   Pada table Panitia dan table Event sekolah kardinalitas yang dogunakan adalah many to many dikarenakan banyak panitia bisa menyelenggarakan banyak event sekolah dan begitupun sebaliknya, dan untuk menghubungkannya dibutuhkan table pivot (Panitia_Event) sebagai penghubung kedua table yang ber-kardinalitas many to many. Lalu data pada kedua table terhubung melalui "Id_Panitia_Event" yang menjadi foreign key.
**e. One to Many (Pembina ke Eskul)**
   Pada table Pembina dan table Eskul  kardinalitas yang digunakan adalah one to many dikarenakan satu eskul bisa memiliki banyak pembina tetapi satu pembina tidak bisa memiliki banyak eskul . Lalu data pada kedua table terhubung melalui "Id_Eskul" sebagai Foreign key.