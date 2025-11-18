import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = 'Pengguna';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Pengguna';
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1A1A2E);
    const Color accentColor = Color(0xFF53BF9D);
    const Color electricBlue = Color(0xFF0F3460);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWelcomeHeader(),
          const SizedBox(height: 20),

          _buildStatsCards(accentColor),
          const SizedBox(height: 30),

          const Text(
            'Opsi Cepat',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _buildQuickActions(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang,',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 24,
          ),
        ),
        Text(
          _username + '!',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards(Color accentColor) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
              Icons.task_alt, 'Tugas Selesai', '12', accentColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
              Icons.pending_actions, 'Berlangsung', '5', Colors.orange),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionIcon(Icons.add, 'Baru', () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tambah Tugas Baru')));
        }),
        _buildActionIcon(Icons.search, 'Cari', () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cari Tugas')));
        }),
        _buildActionIcon(Icons.settings, 'Pengaturan', () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pengaturan')));
        }),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value,
      Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
