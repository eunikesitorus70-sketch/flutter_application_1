import 'package:flutter/material.dart'; //mengimpor library Material Flutter

class ProdukDetailPage extends StatelessWidget { //Membuat ProdukDetailPage
  final String namaProduk;
  final int harga;
  final String icon;
  final VoidCallback onTambahKeranjang;

  const ProdukDetailPage({
    super.key,
    required this.namaProduk,
    required this.harga,
    required this.icon,
    required this.onTambahKeranjang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text( //Menampilkan ikon produk
              icon,
              style: const TextStyle(
                fontSize: 100,
              ),
            ),

            const SizedBox(height: 20),

            Text( //menampilkan nama produk
              namaProduk,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text( //menampilkan harga produk
              'Rp $harga',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const Spacer(), //spacer digunakan untuk memberikan jarak antara widget di atas dan tombol di bawah.

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  onTambahKeranjang();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$namaProduk ditambahkan ke keranjang',
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.shopping_cart,
                ),

                label: const Text(
                  'Tambah ke Keranjang',
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}