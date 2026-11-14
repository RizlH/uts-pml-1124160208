import 'package:flutter/material.dart';
import '../main.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // data profil awal (ganti dengan data kamu sendiri)
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

  // pindah ke halaman edit
  Future<void> _bukaEditProfil() async {
    // tunggu hasil dari halaman edit (data baru)
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profile),
      ),
    );

    // kalau ada data baru, simpan dan tampilkan ulang dengan setState
    if (hasil != null) {
      setState(() {
        profile = hasil as Profile;
      });
    }
  }

  // true kalau sekarang sedang mode gelap
  bool get _isDark => temaNotifier.value == ThemeMode.dark;

  // ganti tema terang <-> gelap
  void _gantiTema(bool gelap) {
    setState(() {
      temaNotifier.value = gelap ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          // tombol ikon untuk ganti tema
          IconButton(
            icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              _gantiTema(!_isDark);
            },
          ),
        ],
      ),

      // menu samping (geser dari kiri atau tekan ikon garis tiga)
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/foto.jpg'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profile.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                // tutup drawer saja, karena sudah di halaman profil
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                Navigator.pushNamed(context, '/about');
              },
            ),
            // switch mode gelap
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              value: _isDark,
              onChanged: (nilai) {
                _gantiTema(nilai);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

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

      // tombol di pojok kanan bawah untuk edit profil
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaEditProfil,
        child: const Icon(Icons.edit),
      ),
    );
  }
}