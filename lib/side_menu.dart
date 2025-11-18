import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:h1d023018_tugas7/home_page.dart'; 
import 'package:h1d023018_tugas7/about_page.dart';
import 'package:h1d023018_tugas7/login_page.dart';
import 'package:h1d023018_tugas7/main.dart'; 

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String namauser = 'Tamu';

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

  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); 
    
    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView( 
        padding: EdgeInsets.zero,
        children: [
         
          UserAccountsDrawerHeader(
            accountName: Text(
              namauser, 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text('user@email.com'), 
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: AppColors.primary),
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
             
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=2073&auto=format&fit=crop'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
          ),
          
          
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary), 
            title: const Text('Home'), 
            onTap: () { 
              
              Navigator.pushReplacement( 
                context,
                MaterialPageRoute(builder: (context) => const HomePage()), 
              );
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.primary), 
            title: const Text('About'), 
            onTap: () { 
              Navigator.pushReplacement( 
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()), 
              );
            },
          ),
          
          const Divider(thickness: 1),
          
          
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.accent),
            title: const Text('Logout', style: TextStyle(color: AppColors.accent)),
            onTap: _handleLogout,
          ),
        ],
      ),
    );
  }
}