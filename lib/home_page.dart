import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:h1d023018_tugas7/side_menu.dart';
import 'package:h1d023018_tugas7/main.dart'; 

class HomePage extends StatefulWidget { 
  const HomePage({super.key}); 

  @override
  State<HomePage> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> { 
  String namauser = ''; 

  @override
  void initState() {
    super.initState();
    _loadUsername(); 
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    setState(() {
      namauser = prefs.getString('username') ?? 'Tamu';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Home Page'), 
      ),
      drawer: const SideMenu(), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selamat Datang!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          namauser,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Aktivitas Musim Panas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 15),
          
            _buildActivityCard(
              Icons.beach_access, 'Bersantai', 'Nikmati pantai berpasir.', AppColors.accent
            ),
            _buildActivityCard(
              Icons.pool, 'Berenang', 'Segarkan diri di kolam renang.', AppColors.primary
            ),
            _buildActivityCard(
              Icons.local_drink, 'Minuman Segar', 'Es kelapa muda menanti.', AppColors.textLight
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(IconData icon, String title, String subtitle, Color iconColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, size: 40, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}