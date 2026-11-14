import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

// Menyimpan mode tema saat ini (terang / gelap).
// Kalau nilainya diubah, MaterialApp otomatis ikut berubah.
final ValueNotifier<ThemeMode> temaNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: temaNotifier,
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Profil Rizal Hermawan',
          debugShowCheckedModeBanner: false,

          // tema terang dengan warna sendiri (teal)
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.light,
            ),
          ),

          // tema gelap dengan warna yang sama
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.dark,
            ),
          ),

          // mode yang dipakai sekarang
          themeMode: mode,

          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/profile': (context) => const ProfilePage(),
            '/about': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}