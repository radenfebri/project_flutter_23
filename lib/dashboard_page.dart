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
  child: ListView(
    padding: EdgeInsets.all(16),
    children: [
      ListTile(
        title: Text('Nama Lengkap'),
        subtitle: Text('John'), // Ganti dengan username pengguna
        leading: Icon(Icons.person),
      ),
      ListTile(
        title: Text('Username'),
        subtitle: Text('john_doe123'), // Ganti dengan username pengguna
        leading: Icon(Icons.person),
      ),
      ListTile(
        title: Text('Email'),
        subtitle: Text('johndoe@example.com'), // Ganti dengan alamat email pengguna
        leading: Icon(Icons.email),
      ),
      ListTile(
        title: Text('Tanggal Lahir'),
        subtitle: Text('23 Maret 2001'), // Ganti dengan alamat email pengguna
        leading: Icon(Icons.date_range),
      ),
      ListTile(
        title: Text('Gender'),
        subtitle: Text('Laki-laki'), // Ganti dengan alamat email pengguna
        leading: Icon(Icons.search),
      ),
      ListTile(
        title: Text('Agama'),
        subtitle: Text('Islam'), // Ganti dengan alamat email pengguna
        leading: Icon(Icons.privacy_tip),
      ),
      ListTile(
        title: Text('Alamat'),
        subtitle: Text('Jl. Contoh No. 123, Kota Contoh'), // Ganti dengan alamat pengguna
        leading: Icon(Icons.location_on),
      ),
      SizedBox(height: 16), // Berikan sedikit jarak antara informasi akun dan tombol
      ElevatedButton(
        onPressed: () {
          // Tambahkan aksi untuk menu 1
        },
        child: const Text('Edit'),
      ),
    ],
  ),
)

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
