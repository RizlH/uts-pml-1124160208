import 'package:flutter/material.dart';

// Widget kecil yang dipakai berulang: Card berisi ListTile dengan ikon
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String judul;
  final String isi;

  const InfoTile({
    super.key,
    required this.icon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(judul),
        subtitle: Text(isi),
      ),
    );
  }
}