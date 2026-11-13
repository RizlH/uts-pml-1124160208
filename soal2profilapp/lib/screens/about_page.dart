import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Keahlian & Hobi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Mekanik mobil'),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Fotografi'),
          ),
          ListTile(
            leading: Icon(Icons.movie_creation_outlined),
            title: Text('Bermain game'),
          ),
          ListTile(
            leading: Icon(Icons.menu_book_outlined),
            title: Text('Membaca buku'),
          ),
          Divider(height: 32),
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SD Negeri Cimone 5'),
            subtitle: Text('2012 - 2018'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SMP Negeri 20 Kota Tangerang'),
            subtitle: Text('2018 - 2021'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SMK Tangerang Global'),
            subtitle: Text('2021 - 2024'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Global Institute'),
            subtitle: Text('2024 - sekarang'),
          ),
        ],
      ),
    );
  }
}