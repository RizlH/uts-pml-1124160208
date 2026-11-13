import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  // data profil yang sedang dipakai dikirim dari halaman Profil
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _noHpController;
  late TextEditingController _githubController;

  @override
  void initState() {
    super.initState();
    // isi form dengan data profil saat ini (nilai awal)
    _namaController = TextEditingController(text: widget.profile.nama);
    _nimController = TextEditingController(text: widget.profile.nim);
    _prodiController = TextEditingController(text: widget.profile.prodi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _bioController = TextEditingController(text: widget.profile.bio);
    _emailController = TextEditingController(text: widget.profile.email);
    _noHpController = TextEditingController(text: widget.profile.noHp);
    _githubController = TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _simpan() {
    // cek validasi dulu
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // buat objek Profile baru dari isi form
    final dataBaru = Profile(
      nama: _namaController.text,
      nim: _nimController.text,
      prodi: _prodiController.text,
      kelas: _kelasController.text,
      bio: _bioController.text,
      email: _emailController.text,
      noHp: _noHpController.text,
      github: _githubController.text,
    );

    // kembali ke halaman Profil sambil membawa data baru
    Navigator.pop(context, dataBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Bio Singkat',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _noHpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'No. HP',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. HP tidak boleh kosong';
                  }
                  // hanya angka, panjang 10 sampai 13 digit
                  final hanyaAngka = RegExp(r'^[0-9]{10,13}$');
                  if (!hanyaAngka.hasMatch(value)) {
                    return 'No. HP harus angka 10-13 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(
                  labelText: 'Akun GitHub',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _simpan,
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}