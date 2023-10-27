import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    // Logika logout disini
    // Anda dapat menghapus data sesi, menghapus token, dll.

    // Navigasi ke halaman login setelah logout
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan aksi notifikasi di sini
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Tambahkan aksi logout saat tombol ditekan
              _showLogoutConfirmationDialog(context);
              // _logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi untuk menu 1
              },
              child: const Text('Menu 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi untuk menu 2
              },
              child: const Text('Menu 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi untuk menu 3
              },
              child: const Text('Menu 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Isi dengan tampilan login Anda
          ],
        ),
      ),
    );
  }
}

Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout disini
              // Anda dapat menghapus data sesi, menghapus token, dll.

              // Navigasi ke halaman login setelah logout
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
