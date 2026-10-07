import 'package:flutter/material.dart'; //material.dart digunakan untuk memakai widget Flutter seperti Scaffold, TextFormField, Form, ElevatedButton

import '../models/produk.dart';// untuk memakai model Produk, yaitu struktur data yang menyimpan nama, harga, dan ikon produk.

class TambahProdukPage extends StatefulWidget {
  const TambahProdukPage({super.key});

  @override
  State<TambahProdukPage> createState() =>
      _TambahProdukPageState();
}

class _TambahProdukPageState
    extends State<TambahProdukPage> { //Class ini berisi seluruh data dan proses yang terjadi pada halaman tambah produk.

  final _formKey = //_formKey digunakan untuk mengontrol dan melakukan validasi terhadap Form.
      GlobalKey<FormState>();

  final _namaController = //digunakan untuk mengambil teks nama produk.
      TextEditingController(); //untuk mengambil isi dari TextFormField

  final _hargaController =
      TextEditingController();

  String _icon = '📦';

  @override
  void dispose() { //untuk membersihkan TextEditingController ketika halaman sudah tidak digunakan.
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  // Fungsi untuk menyimpan produk baru
  void _simpanProduk() {
    if (_formKey.currentState!.validate()) {
      final produkBaru = Produk(  //membuat produk baru dengan nama, harga, dan ikon yang diambil dari TextEditingController dan variabel _icon.
        nama: _namaController.text.trim(),
        harga: int.parse(
          _hargaController.text,
        ),
        icon: _icon,
      );

      Navigator.pop( //mengirim produk kembali
        context,
        produkBaru,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //digunakan sebagai struktur dasar halaman.
      appBar: AppBar( //membuat appbar dengan judul Tambah Produk.
        title: const Text(
          'Tambah Produk',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              TextFormField(
                controller: _namaController,

                decoration:
                    const InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.shopping_bag,
                  ),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Nama produk wajib diisi';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField( //untuk membuat kolom input harga produk dengan validasi agar hanya menerima angka dan tidak boleh kosong.
                controller: _hargaController,

                keyboardType:
                    TextInputType.number,

                decoration:
                    const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.attach_money,
                  ),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Harga wajib diisi';
                  }

                  final harga =
                      int.tryParse(value);

                  if (harga == null) {
                    return 'Harga harus berupa angka';
                  }

                  if (harga <= 0) {
                    return 'Harga harus lebih dari 0';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Pilih Ikon Produk',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,

                children: [
                  _pilihIcon('📦'),
                  _pilihIcon('💻'),
                  _pilihIcon('📱'),
                  _pilihIcon('🎧'),
                  _pilihIcon('⌨️'),
                  _pilihIcon('🖱️'),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: _simpanProduk,

                  icon: const Icon(
                    Icons.save,
                  ),

                  label: const Text(
                    'Simpan Produk',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pilihIcon(String icon) { //untuk membuat widget pilihan ikon secara reusable.
    return GestureDetector(
      onTap: () {
        setState(() {
          _icon = icon;
        });
      },

      child: Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          border: Border.all(
            width: _icon == icon ? 3 : 1,
          ),

          borderRadius:
              BorderRadius.circular(10),
        ),

        child: Text(
          icon,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}