import 'package:flutter/material.dart';

import '../models/produk.dart';
import '../widget_basic/product_card.dart';
import 'produk_detail_page.dart';
import 'tambah_produk_page.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({super.key});

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> { // membuat state halaman  semua data dan fungsi dapat berubah pada halaman produk.
  // Daftar produk awal
  final List<Produk> produk = [ //Baris 17- 43 untuk mmebuat daftar produk
    Produk(
      nama: 'Laptop',
      harga: 7500000,
      icon: '💻',
    ),
    Produk(
      nama: 'Smartphone',
      harga: 3500000,
      icon: '📱',
    ),
    Produk(
      nama: 'Headset',
      harga: 450000,
      icon: '🎧',
    ),
    Produk(
      nama: 'Keyboard',
      harga: 350000,
      icon: '⌨️',
    ),
    Produk(
      nama: 'Mouse',
      harga: 200000,
      icon: '🖱️',
    ),
  ];

  // variabel Jumlah produk yang masuk keranjang
  int jumlahKeranjang = 0;

  // Menambah jumlah keranjang
  void _tambahKeranjang() {
    setState(() {
      jumlahKeranjang++;
    });
  }

  // Menghapus produk
  void _hapusProduk(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog( //untuk memberikan konfirmasi kepada pengguna. Nama produk yang akan dihapus juga ditampilkan menggunakan index dari produk yang dipilih.
          title: const Text('Hapus Produk'),
          content: Text(
            'Apakah kamu yakin ingin menghapus '
            '${produk[index].nama}?',
          ),
          actions: [
            TextButton( // tombol batal
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                final namaProduk = produk[index].nama; // menghapus produk dengan setstate

                setState(() {
                  produk.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar( //snackbar untuk menampilkan pesan bahwa produk berhasil dihapus.
                  SnackBar(
                    content: Text(
                      '$namaProduk berhasil dihapus',
                    ),
                  ),
                );
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  // Membuka halaman tambah produk
  Future<void> _tambahProdukBaru() async {
    final Produk? produkBaru = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahProdukPage(),
      ),
    );

    // Menambahkan produk baru
    if (produkBaru != null) {
      setState(() {
        produk.add(produkBaru);
      });

      ScaffoldMessenger.of(context).showSnackBar( //snackbar untuk menampilkan pesan bahwa produk berhasil ditambahkan.
        SnackBar(
          content: Text(
            '${produkBaru.nama} berhasil ditambahkan',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),

            child: Stack(
              clipBehavior: Clip.none,

              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 28,
                ),

                // Badge jumlah keranjang
                if (jumlahKeranjang > 0)
                  Positioned(
                    right: -8,
                    top: -8,

                    child: Container(
                      padding: const EdgeInsets.all(5),

                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),

                      child: Text(
                        '$jumlahKeranjang',

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      // Daftar produk
      body: produk.isEmpty
          ? const Center(
              child: Text('Belum ada produk'),
            )
          : ListView.builder(
              itemCount: produk.length,

              itemBuilder: (context, index) {
                final item = produk[index];

                return ProductCard(
                  nama: item.nama,
                  harga: item.harga,
                  icon: item.icon,

                  // Klik card → Detail Produk
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProdukDetailPage(
                            namaProduk: item.nama,
                            harga: item.harga,
                            icon: item.icon,

                            // Tombol tambah keranjang
                            onTambahKeranjang:
                                _tambahKeranjang,
                          );
                        },
                      ),
                    );
                  },

                  // Tombol hapus
                  onDelete: () {
                    _hapusProduk(index);
                  },
                );
              },
            ),

      // Tombol tambah produk
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahProdukBaru,

        child: const Icon(Icons.add),
      ),
    );
  }
}