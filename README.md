# Litracker-mobile

`PBP A - Kelompok A01`
`url:	`

### Anggota 👨‍💻👩‍💻:
1. Anindya Maulida Widyatmoko - 2206082915
2. Henry Soedibjo - 2206827762
3. Muhammad Fawwaz Arshad Said - 2206082511
4. Haffie Noorcahyo - 2206081515
5. Muhammad Daffa Grahito Triharsanto - 2206820075


## Deskripsi Aplikasi
Litracker adalah sebuah aplikasi pendidikan digital yang menawarkan pengalaman pembelajaran literasi yang interaktif dan mendalam bagi penggunanya. Dengan fitur-fitur unggulan seperti autentikasi yang aman, rekomendasi buku yang disesuaikan, pencarian buku yang canggih, serta komunitas ulasan buku, Litracker bukan hanya sekadar aplikasi, melainkan teman setia bagi para pencinta literasi. Aplikasi ini tidak hanya memfasilitasi pengguna dalam menemukan buku sesuai minat mereka, tetapi juga membentuk komunitas literasi yang kuat. 
Melalui fitur ulasan buku, Litracker menciptakan ruang untuk berbagi pemikiran dan pandangan, memperkuat konektivitas antar-pengguna. Manfaat utama dari Litracker terletak pada peningkatan minat literasi di Indonesia. Dengan algoritma rekomendasi yang canggih, Litracker merangsang minat membaca siswa, mendukung mereka menjelajahi dunia literasi, dan secara signifikan memajukan kemampuan literasi. Aplikasi ini bukan hanya mendukung pembelajaran perorangan, tetapi juga membangun fondasi untuk komunitas literasi yang berkembang, mendekatkan masyarakat pada keajaiban membaca, dan memperkaya budaya literasi di Indonesia. Dengan Litracker, literasi bukan hanya menjadi keterampilan, tetapi gaya hidup yang diperkaya oleh pengalaman bersama dalam dunia kata-kata dan ide-ide yang menginspirasi.

## Daftar Modul yang diimplementasikan
Buku (Dikerjakan oleh Muhammad Daffa Grahito)
Fitur “Buku” akan menampilkan buku-buku dan bisa diakses oleh user, guest, dan admin. Perbedaan pengaksesan admin dengan user dan guest yaitu:
admin:
create buku: ketika admin ingin menambahkan atau membuat sebuah buku
delete buku: ketika admin ingin menghapus buku
edit informasi buku: ketika admin ingin merubah informasi terkait buku tersebut
user:
melihat detail buku: user hanya bisa melihat isi dari buku yang sudah ditambahkan oleh admin

Buku Favorit (Data Favorit buku tiap user) (Haffie Noorcahyo)
"Buku Favorit" adalah sebuah komponen yang memungkinkan pengguna untuk mengelola buku-buku yang mereka tandai sebagai favorit. Dalam operasi "Create," pengguna dapat menambahkan buku baru ke daftar favorit mereka dengan mengidentifikasi buku tersebut berdasarkan atribut seperti ID buku. Dalam operasi "Read," pengguna dapat melihat daftar buku favorit mereka. Dalam operasi "Update," pengguna dapat mengedit atau memperbarui informasi buku favorit yang telah ada dalam daftar mereka. Akhirnya, dalam operasi "Delete," pengguna dapat menghapus buku dari daftar favorit mereka jika mereka tidak lagi ingin menyimpannya. Model ini memastikan pengguna memiliki kendali penuh atas buku-buku yang mereka pilih sebagai favorit, meningkatkan pengalaman personalisasi dan interaksi dengan platform pendidikan literasi.
Review Buku (review setiap buku dari user) (Anindya Maulida Widyatmoko)
Review Buku dimana pengguna dapat memberikan ulasan dan pandangan pribadi mereka terhadap buku yang telah mereka baca. 
Create :
Ketika pengguna ingin membuat ulasan baru untuk suatu buku yang telah mereka baca. Pengguna dapat memberikan peringkat dengan jumlah bintang, menambahkan judul ulasan, dan menulis ulasan mereka sendiri tentang buku tersebut. Proses ini memungkinkan pengguna untuk berbagi pengalaman dan pandangan mereka dengan pengguna lain.
Update :
Ketika pengguna ingin mengedit ulasan yang telah mereka buat sebelumnya. Pengguna dapat memperbarui peringkat bintang, mengubah judul ulasan, atau memperbarui konten ulasan sesuai dengan perubahan pendapat mereka tentang buku tersebut. Ini memberikan fleksibilitas kepada pengguna untuk memperbarui ulasan mereka seiring berjalannya waktu atau setelah membaca buku lebih lanjut.
Edit :
Ketika pengguna ingin mengoreksi atau memperbaiki informasi yang mereka masukkan dalam ulasan. Pengguna dapat memperbaiki tata bahasa, struktur kalimat, atau kesalahan pengetikan yang mungkin terjadi saat menulis ulasan.
Read:
Pengguna dapat membaca ulasan review buku pengguna lain untuk mendapatkan rekomendasi mendalam terkait kecocokan dengan buku yang sesuai dengan preferensi mereka.
Delete :
Ketika pengguna ingin menghapus ulasan yang mereka buat sebelumnya. Pengguna dapat memilih untuk menghapus ulasan jika mereka tidak ingin ulasan tersebut tersedia untuk publik atau jika mereka ingin menarik ulasan yang tidak lagi mewakili pendapat mereka.

Reading History (buku yang telah dibaca user) (Henry Soedibjo)
Reading History akan mencatat buku yang telah dibaca oleh pengguna. Penjelasan secara implementasi CRUDnya seperti dibawah ini:
Create (Membuat Data Riwayat Bacaan):
Ketika seorang pengguna menyelesaikan membaca sebuah buku, maka akan dibuat catatan baru dalam model Reading History.
Informasi seperti ID pengguna, ID buku yang telah dibaca, tanggal selesai membaca, dan mungkin sejauh mana kemajuan yang telah dicapai oleh pengguna (misalnya, halaman terakhir yang dibaca) akan disimpan.
Read (Membaca Data Riwayat Bacaan):
Pengguna dapat membaca riwayat bacaan mereka dengan mudah untuk melihat buku mana yang telah mereka baca sebelumnya. Mereka dapat melihat informasi seperti judul buku, penulis, tanggal selesai membaca, dan kemajuan membaca.
Update (Memperbarui Data Riwayat Bacaan):
Pengguna dapat memperbarui data riwayat bacaan mereka jika mereka ingin menambahkan informasi tambahan, seperti tanggal selesai membaca atau kemajuan membaca yang lebih baru.
Misalnya, jika pengguna ingin menandai ulang buku sebagai "Dibaca Kembali" atau "Selesai," mereka dapat memperbarui catatan ini.
Delete (Menghapus Data Riwayat Bacaan):
Pengguna juga harus memiliki opsi untuk menghapus buku dari riwayat bacaan mereka jika mereka ingin menghapus buku tertentu dari catatan mereka.
Upvote Buku (User dapat memberikan vote ke buku yang mereka sukai) (Muhammad Daffa Grahito Triharsanto)
Upvote buku akan memberikan status populer pada buku. Penjelasan secara implementasi CRUD sebagai berikut:
Create (Menambahkan Buku ke List Buku yang Diupvote pada Dashboard)
Pengguna dapat menekan tombol upvote pada buku yang dinilai menarik. Pada dashboard akan ditampilkan buku yang diupvote.
Read (Melihat Buku yang Diupvote)
Pada laman dashboard, pengguna dapat melihat buku yang mereka upvote.
Update (Memperbarui Peringkat Buku)
Buku akan disorting berdasarkan peringkat. Dalam hal ini, peringkat diambil dari total banyak vote yang diperoleh. Peringkat buku-buku akan diupdate seiring bertambah atau berkurangnya upvote.
Delete (Menghapus Buku dari Daftar Upvote)
Pengguna dapat undo upvote buku sehingga buku akan keluar dari daftar list upvote book mereka.

Autentikasi (Login dan Register)
Autentikasi akan memberikan akses terhadap masing-masing tipe akun. Adapun akses yang diberikan sebagai berikut:

Create (Membuat akun baru)
Pengguna dapat membuat akun baru dengan memasukkan identitas data diri mereka beserta password.
Read (Melihat Informasi Akun)
Pada navbar, terdapat profile yang memperlihatkan informasi akun. Jika akun tersebut adalah akun admin, maka informasi profile akan menampilkan admin. Jika akun tersebut adalah akun user, maka akan menampilkan nama user.
Update (Memperbarui Peringkat Buku)
User dapat memperbarui kata sandi mereka. Hal ini memungkinkan pengguna mendapatkan keamanan maksimal ketika terdapat aktivitas mencurigakan pada akun.
Admin dapat melihat daftar user dan mendapatkan pembaruan tiap kali ada user yang mendaftar.
Delete (Menghapus )
Pengguna dapat undo upvote buku sehingga buku akan keluar dari daftar list upvote book mereka.


## Peran atau aktor pengguna aplikasi
**i. Admin**
Admin memiliki kontrol penuh atas Litracker yang dapat  bisa mengubah, memperbarui, dan mengelola data. Admin menjaga keamanan dan kinerja platform ini. Selain itu, admin juga bisa memberikan izin akses kepada pengguna untuk mengakses fitur-fitur yang ada di Litracker seperti Review buku, favorite book, dan fitur-fitur lain yang dapat digunakan oleh Login user. Pada dasarnya seseorang harus register sebagai admin terlebih dahulu di registration page untuk menjadi admin di Litracker.

**ii. Logged in user**
Pengguna yang sudah login bisa lakukan banyak hal juga. Mereka bisa mengakses fitur-fitur seperti Review buku, favorite book, dan fitur-fitur lain yang terdapat di Litracker namun tidak dapat mengakes fitur-fitur admin. Pada dasarnya untuk menjadi user di Litracker, perlu register terlebih dahulu di registration page.  

## Alur pengintegrasian dengan web service dengan aplikasi web proyek tengah semeste
Integrasi dengan Situs Web
Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.
Mengimplementasikan sebuah wrapper class dengan menggunakan library http dan map untuk mendukung penggunaan cookie-based authentication pada aplikasi.
Mengimplementasikan REST API pada Django (views.py) dengan menggunakan JsonResponse atau Django JSON Serializer.
Mengimplementasikan desain front-end untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
Melakukan integrasi antara front-end dengan back-end dengan menggunakan konsep asynchronous HTTP.

## Link Figma
https://www.figma.com/file/2qF9VsruxY210YQlroCY7p/Untitled?type=design&node-id=0%3A1&mode=design&t=sHFg9JkCRC0ICr06-1 

## Link Wireframe
https://whimsical.com/pbp-mobile-8TPPj29gyib1ZC5A4HMsx2 

## Tautan berita acarahttps://docs.google.com/spreadsheets/d/1fj9XA7TRMVrPygOGq7fheCCZ_BrliEZZeipF9xWb1v4/edit?usp=sharing 
