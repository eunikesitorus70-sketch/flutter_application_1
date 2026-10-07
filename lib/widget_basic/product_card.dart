import 'package:flutter/material.dart'; // mengimpor library Material Flutter agar kita bisa menggunakan widget seperti Container, Row, Column, Text, IconButton, dan lainnya.

class ProductCard extends StatelessWidget { //menampilkan data yang diberikan dari halaman lain dan tidak mengubah data sendiri.
  final String nama;
  final int harga;
  final String icon;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ProductCard({ //untuk menerima data dari ProdukListPage.
    super.key,
    required this.nama,
    required this.harga,
    required this.icon,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //agar seluruh kartu produk dapat ditekan atau diklik.
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text( //menampilkan icon produk dalam bentuk emoji
              icon,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),

            const SizedBox(width: 12),

            Expanded( // agar widget di dalamnya dapat mengisi ruang yang tersedia di antara ikon dan tombol hapus.
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text( //menampilkan nama produk
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text( //menampilkan harga produk
                    'Rp $harga',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            if (onDelete != null) // tombol hapus
              IconButton(
                onPressed: onDelete, //jika diberikan ondelete makan tombol hapus akan ditampilkan
                //ketika tombol hapus ditekan funngsi ondelete akan dijalankan.
                icon: const Icon(
                  Icons.delete,
                ),
              ),
          ],
        ),
      ),
    );
  }
}