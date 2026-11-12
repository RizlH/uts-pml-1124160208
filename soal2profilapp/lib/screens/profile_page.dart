import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
    nama: 'Rizal Hermawan',
    nim: '1124160208',
    prodi: 'Teknik Informatika',
    kelas: 'TI-24-P-SE3',
    bio: 'Mahasiswa yang sedang belajar Flutter.',
    email: 'rzlhrmwn00@gmail.com',
    noHp: '085783770890',
    github: 'RizlH',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // foto diambil dari folder assets/images
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/foto.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              profile.nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('NIM: ${profile.nim}'),
            Text('Prodi: ${profile.prodi}'),
            Text('Kelas: ${profile.kelas}'),
            const SizedBox(height: 12),
            Text(
              profile.bio,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // kontak memakai widget InfoTile (Card + ListTile)
            InfoTile(icon: Icons.email, judul: 'Email', isi: profile.email),
            InfoTile(icon: Icons.phone, judul: 'No. HP', isi: profile.noHp),
            InfoTile(icon: Icons.code, judul: 'GitHub', isi: profile.github),
          ],
        ),
      ),
    );
  }
}