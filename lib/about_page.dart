import 'package:flutter/material.dart';
import 'package:h1d023018_tugas7/side_menu.dart';
import 'package:h1d023018_tugas7/main.dart'; 

class AboutPage extends StatelessWidget { 
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('About Page'), 
      ),
      drawer: const SideMenu(), 
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center( 
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.info_outline, size: 60, color: AppColors.primary),
                  SizedBox(height: 15),
                  Text(
                    'Tentang Aplikasi', 
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aplikasi ini dibuat untuk Tugas 7.\n\nImplementasi:\n- Routes\n- Side Menu\n- Login (admin/admin)\n- Local Storage\n- Tema Summer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}