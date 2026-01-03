# Aplikasi CRUD (Firebase & LocalStorage)


## Preview Aplikasi


### 1. Halaman Utama (List View)
Perbandingan tampilan halaman awal saat belum ada data yang dimasukkan, dan tampilan setelah data berhasil ditambahkan dari database.

| Tampilan Awal (Data Kosong) | Tampilan Setelah Data Masuk |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/8c137ad8-132f-4956-941e-57b178652f43" width="350" alt="List Kosong"> | <img src="https://github.com/user-attachments/assets/61ef46a4-e98f-42c9-aa04-9ad66ee89c9a" width="350" alt="List Terisi"> |
| *Status awal saat aplikasi dibuka.* | *Data berhasil dimuat dari Firebase/LocalStorage.* |

### 2. Formulir Data (Create & Update)
Halaman formulir digunakan untuk fungsi menambah data baru dan mengubah data yang sudah dipilih.

| Menambah Data Baru (Create) | Mengubah Data (Update) |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/d85e0d60-147c-47ab-954f-c9b1577b8308" width="350" alt="Input Data Baru"> | <img src="https://github.com/user-attachments/assets/35c4f76b-6696-4d25-8b91-b238b99775fd" width="350" alt="Update Data"> |
| *Contoh pengisian data pada form tambah.* | *Form edit terisi otomatis dengan data yang dipilih.* |
| *(Tampilan form kosong: [Lihat disini](https://github.com/user-attachments/assets/1a0fbc7b-8e38-4df1-9652-8ddf62905cba))* | |

---

## ☁️ Backend & Penyimpanan

Aplikasi ini menggunakan sistem penyimpanan Hybrid. Data disimpan di Cloud (Firebase) dan disinkronkan dengan LocalStorage browser (termasuk penyimpanan referensi gambar jika ada).

![Firebase Overview](https://github.com/user-attachments/assets/c5d8482f-c4c9-4c2f-9226-3d7127b56f4e)
*Tampilan konsol Firebase Realtime Database dan ilustrasi penyimpanan lokal.*

---
