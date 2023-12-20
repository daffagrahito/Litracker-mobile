# Litracker-mobile

**PBP A - Kelompok A01**
**URL: (https://litracker-a01-tk.pbp.cs.ui.ac.id/)**

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
1. **Buku** (Dikerjakan oleh Muhammad Daffa Grahito)
   - Fitur "Buku" akan menampilkan buku-buku dan bisa diakses oleh user, guest, dan admin.
   - Perbedaan pengaksesan admin dengan user dan guest yaitu:
     - Admin:
       - Create buku: Ketika admin ingin menambahkan atau membuat sebuah buku.
       - Delete buku: Ketika admin ingin menghapus buku.
       - Edit informasi buku: Ketika admin ingin merubah informasi terkait buku tersebut.
     - User:
       - Melihat detail buku: User hanya bisa melihat isi dari buku yang sudah ditambahkan oleh admin.
 
2. **Buku Favorit (Data Favorit buku tiap user)** (Haffie Noorcahyo)
   - "Buku Favorit" adalah sebuah komponen yang memungkinkan pengguna untuk mengelola buku-buku yang mereka tandai sebagai favorit.
   - Pengguna dapat menambahkan, melihat, mengedit, dan menghapus buku dari daftar favorit mereka.

3. **Review Buku (review setiap buku dari user)** (Dikerjakan oleh Anindya Maulida Widyatmoko)
   - Review Buku memungkinkan pengguna untuk memberikan ulasan dan pandangan pribadi mereka terhadap buku yang telah mereka baca.
   - Pengguna dapat membuat, membaca, mengedit, dan menghapus ulasan buku.

4. **Reading History (buku yang telah dibaca user)** (Dikerjakan oleh Henry Soedibjo)
   - Reading History akan mencatat buku yang telah dibaca oleh pengguna.
   - Pengguna dapat menambahkan, melihat, memperbarui, dan menghapus riwayat bacaan mereka.

5. **Upvote Buku (User dapat memberikan vote ke buku yang mereka sukai)** (Dikerjakan oleh Muhammad Fawwaz Arshad Said)
   - Upvote buku akan memberikan status populer pada buku.
   - Pengguna dapat menambahkan, melihat, memperbarui, dan menghapus upvote buku.

6. **Autentikasi (Login dan Register)**
   - Autentikasi memberikan akses terhadap masing-masing tipe akun, seperti admin dan logged in user.
   - Pengguna dapat membuat akun baru, melihat informasi akun, memperbarui kata sandi, dan menghapus akun.

## Peran atau aktor pengguna aplikasi
**i. Admin**
Admin memiliki kontrol penuh atas Litracker dan dapat mengubah, memperbarui, dan mengelola data. Admin menjaga keamanan dan kinerja platform ini serta memberikan izin akses kepada pengguna.

**ii. Logged in user**
Pengguna yang sudah login dapat mengakses fitur-fitur seperti Review buku, favorite book, dan fitur-fitur lain di Litracker. Mereka tidak memiliki akses ke fitur-fitur admin.

## Alur pengintegrasian dengan web service dengan aplikasi web proyek tengah semeste
Integrasi dengan Situs Web:
- Implementasikan wrapper class dengan menggunakan library http dan map untuk mendukung penggunaan cookie-based authentication pada aplikasi.
- Implementasikan REST API pada Django (views.py) dengan menggunakan JsonResponse atau Django JSON Serializer.
- Implementasikan desain front-end untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
- Melakukan integrasi antara front-end dengan back-end dengan menggunakan konsep asynchronous HTTP.

## Link Figma Desain
[Link Figma](https://www.figma.com/file/2qF9VsruxY210YQlroCY7p/Untitled?type=design&node-id=0%3A1&mode=design&t=sHFg9JkCRC0ICr06-1)

## Link Wireframe
[Link Wireframe](https://whimsical.com/pbp-mobile-8TPPj29gyib1ZC5A4HMsx2)

## Tautan berita acara
[Tautan berita acara](https://docs.google.com/spreadsheets/d/1fj9XA7TRMVrPygOGq7fheCCZ_BrliEZZeipF9xWb1v4/edit?usp=sharing)
