import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugashttpresti/login.dart';
import 'package:tugashttpresti/profile.dart';
import 'package:tugashttpresti/list.dart';

class Home_Page extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => List_Page()),
                );
              },
              child: Text('Detail'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman profile
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile_Page()),
                );
              },
              child: Text('Profile'),
            ),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout() async {
    // Hapus status login yang disimpan
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi kembali ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login_Page()),
    );
  }
}
