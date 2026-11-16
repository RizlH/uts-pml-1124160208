import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

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
          const SizedBox(height: 16),
          InfoTile(icon: Icons.garage, judul: 'Keahlian:', isi: "Mekanik Mobil"),
          InfoTile(icon: Icons.monitor, judul: 'Keahlian:', isi: "Frontend"),
          InfoTile(icon: Icons.gamepad, judul: 'Hobi:', isi: "Bermain Game"),
          InfoTile(icon: Icons.movie, judul: 'Hobi:', isi: "Menonton Film"),
          const SizedBox(height: 16),
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          InfoTile(icon: Icons.school, judul: 'SDN Cimone 5', isi: "2012 - 2018"),
          InfoTile(icon: Icons.school, judul: 'SMPN 20 Kota Tangerang', isi: "2018 - 2021"),
          InfoTile(icon: Icons.school, judul: 'SMK Tangerang Global', isi: "2021 - 2024"),
          InfoTile(icon: Icons.account_balance, judul: 'Global Institute', isi: "2024 - sekarang"),
        ],
      ),
    );
  }
}