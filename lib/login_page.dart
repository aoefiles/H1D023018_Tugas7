import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:h1d023018_tugas7/home_page.dart'; 
import 'package:h1d023018_tugas7/main.dart';

class LoginPage extends StatefulWidget { 
  const LoginPage({super.key}); 

  @override
  State<LoginPage> createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> { 
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    await prefs.setString('username', _usernameController.text);
  }

  void _showDialog(String pesan, Widget? nextPage) {
    showDialog( 
      context: context,
      builder: (context) {
        return AlertDialog( 
          title: Text(pesan, style: const TextStyle(color: AppColors.textDark)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: [
            TextButton( 
              child: const Text('OK', style: TextStyle(color: AppColors.accent)),
              onPressed: () { 
                
                if (nextPage != null) {
                  Navigator.pushReplacement( 
                    context,
                    MaterialPageRoute(builder: (context) => nextPage), 
                  );
                } else {
                  Navigator.of(context).pop(); 
                }
              },
            ),
          ],
        );
      },
    );
  }


  void _handleLogin() {
    if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
      _saveUsername(); 
      _showDialog('Anda Berhasil Login', const HomePage());
    } else {
      _showDialog('Username dan Password Salah', null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const Icon(Icons.wb_sunny, size: 80, color: AppColors.accent),
              const SizedBox(height: 20),
              const Text(
                'Summer Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController, 
                decoration: const InputDecoration(
                  hintText: 'Masukkan Username', 
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController, 
                obscureText: true, 
                decoration: const InputDecoration(
                  hintText: 'Masukkan Password', 
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _handleLogin, 
                child: const Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}