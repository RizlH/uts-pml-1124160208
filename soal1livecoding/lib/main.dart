import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Rizal Hermawan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Mahasiswa"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('oke, bisa di klik')));
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 40),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Nama: Rizal Hermawan',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'NIM: 1124160208',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16),

                      Card(
                        child: Column(
                          children: const [
                            InfoTile(
                              icon: Icons.phone,
                              label: 'No. HP',
                              value: '0857-8377-0890',
                            ),
                            InfoTile(
                              icon: Icons.email,
                              label: 'Email',
                              value: 'rzlhrmwn00@gmail.com',
                            ),
                            InfoTile(
                              icon: Icons.school,
                              label: 'Kelas',
                              value: 'TI 24 P SE 3',
                            ),
                            InfoTile(
                              icon: Icons.code,
                              label: 'GitHub',
                              value: 'github.com/RizlH',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Column(
                          children: const [
                            InfoTile(
                              icon: Icons.person_4,
                              label: 'Keahlian',
                              value: 'System Analyst',
                            ),
                            InfoTile(
                              icon: Icons.beach_access,
                              label: 'Keahlian',
                              value: 'Web Development',
                            ),
                            InfoTile(
                              icon: Icons.movie,
                              label: 'Hobi',
                              value: 'Menonton Film',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.stars),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}