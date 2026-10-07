import 'package:flutter/material.dart';

import 'produk_list_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> { //Class ini digunakan untuk mengatur perubahan pada navigasi.
  int _tabTerpilih = 0; //untuk menyimpan index menu yang sedang dipilih.

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      const ProdukListPage(),
      const ProfilPage(),
    ];

    return Scaffold(
      body: halaman[_tabTerpilih], //Menampilkan halaman yang dipilih

      bottomNavigationBar: BottomNavigationBar( //untuk membuat menu navigasi di bagian bawah aplikasi.
        currentIndex: _tabTerpilih,

        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}