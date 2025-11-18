import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {const Color primaryColor = Color(0xFF1A1A2E);
  const Color accentColor = Color(0xFF53BF9D);

  return Scaffold(
    backgroundColor: primaryColor,
    appBar: AppBar(
      title: const Text('About'),
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    drawer: const AppDrawer(),
    body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info_outline, color: accentColor, size: 40),
              SizedBox(width: 16),
              Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey.withOpacity(0.2)),
          const SizedBox(height: 20),
          _buildInfoCard(
            icon: Icons.code,
            title: 'Tujuan',
            subtitle:
            'Aplikasi ini dibuat sebagai bagian dari pemenuhan Tugas 7 untuk mata kuliah Praktikum Pemrograman Mobile.',
          ),
          _buildInfoCard(
            icon: Icons.layers,
            title: 'Teknologi',
            subtitle:
            'Dibangun menggunakan Flutter dengan implementasi navigasi (Routes), menu samping (Drawer), autentikasi (Login), dan penyimpanan lokal (Shared Preferences).',
          ),
          _buildInfoCard(
            icon: Icons.design_services,
            title: 'Desain',
            subtitle:
            'Mengusung tema modern minimalis dengan palet warna gelap untuk kenyamanan pengguna.',
          ),
        ],
      ),
    ),
  );
  }

  Widget _buildInfoCard(
      {required IconData icon,
        required String title,
        required String subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 30),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
