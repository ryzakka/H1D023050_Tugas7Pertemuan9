<h1>Tugas 7 Pertemuan 9</h1>
<h2>Dhimas Wildan Nur Zakariya</h2>
<h2>H1D023050</h2>

Logika autentikasi terpusat di dalam file ```lib/pages/login_page.dart.``` Pada fungsi ```_login()```, input dari ```_usernameController``` dan ```_passwordController``` divalidasi terhadap kredensial statis ```('admin' dan 'admin123')```. Jika berhasil, kode ```await prefs.setBool('isLoggedIn', true)``` akan menyimpan status sesi ke penyimpanan lokal, memastikan pengguna tidak perlu login kembali. Jika gagal, ```ScaffoldMessenger.of(context).showSnackBar(...)``` berfungsi untuk menampilkan notifikasi error kepada pengguna. Navigasi antar halaman seperti HomePage dan AboutPage diatur melalui Side Menu yang dibuat di ```lib/widgets/app_drawer.dart```. Di dalam widget ini, fungsi ```Navigator.pushReplacementNamed(context, '/home')``` digunakan untuk berpindah halaman sekaligus mengganti tumpukan navigasi, memberikan pengalaman pengguna yang lebih bersih tanpa riwayat halaman sebelumnya.

![](lib/BerkasScreenshot/g1.png) <br>
![](lib/BerkasScreenshot/g2.png) <br>
![](lib/BerkasScreenshot/g3.png) <br>
![](lib/BerkasScreenshot/g4.png) <br>

