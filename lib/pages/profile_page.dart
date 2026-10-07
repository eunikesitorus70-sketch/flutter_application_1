import 'package:flutter/material.dart'; // mengimport library

class ProfilPage extends StatelessWidget { //membuat halaman profilpage
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // membuat bagian atas halamann dengan judul profil
        title: const Text(
          'Profil',
        ),
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Icon( //menampilkan icon profil pengguna
              Icons.person,
              size: 80,
            ),

            SizedBox(height: 16),

            Text( // menampilkan tulisan profil pengguna
              'Profil Pengguna',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text( //untuk menampilkan keterangan Aplikasi Katalog Produk
              'Aplikasi Katalog Produk',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}